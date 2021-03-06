//
//  MyCdpViewController.swift
//  Cosmostation
//
//  Created by 정용주 on 2020/03/26.
//  Copyright © 2020 wannabit. All rights reserved.
//

import UIKit
import Alamofire

class MyCdpViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myCdpCntLabel: UILabel!
    @IBOutlet weak var myCdpTableView: UITableView!
    
    var mainTabVC: MainTabViewController!
    var refresher: UIRefreshControl!
    
    var mCdpParam: CdpParam = CdpParam.init()
    var mMyCdps: Array<CdpOwen> = Array<CdpOwen>()
    var mKavaPrice = [String:KavaTokenPrice]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myCdpTableView.delegate = self
        self.myCdpTableView.dataSource = self
        self.myCdpTableView.register(UINib(nibName: "CdpListPromotionCell", bundle: nil), forCellReuseIdentifier: "CdpListPromotionCell")
        self.myCdpTableView.register(UINib(nibName: "CdpLisyMyCell", bundle: nil), forCellReuseIdentifier: "CdpLisyMyCell")
        self.myCdpTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.myCdpTableView.rowHeight = UITableView.automaticDimension
        self.myCdpTableView.estimatedRowHeight = UITableView.automaticDimension
        
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(onRequestFetch), for: .valueChanged)
        self.refresher.tintColor = UIColor.white
        self.myCdpTableView.addSubview(refresher)
        
        mCdpParam = BaseData.instance.mCdpParam
        mMyCdps = BaseData.instance.mMyCdps
        sortByCdpId()
        mKavaPrice = BaseData.instance.mKavaPrice
        
        myCdpCntLabel.text = String(mMyCdps.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.mainTabVC = ((self.parent)?.parent)?.parent as? MainTabViewController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onFetchDone(_:)), name: Notification.Name("onFetchDone"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("onFetchDone"), object: nil)
    }
    
    @objc func onRequestFetch() {
        if(!mainTabVC.onFetchAccountData()) {
            self.refresher.endRefreshing()
        }
    }
    
    @objc func onFetchDone(_ notification: NSNotification) {
        mCdpParam = BaseData.instance.mCdpParam
        mMyCdps = BaseData.instance.mMyCdps
        mKavaPrice = BaseData.instance.mKavaPrice
        myCdpCntLabel.text = String(mMyCdps.count)
        sortByCdpId()
        self.myCdpTableView.reloadData()
        self.refresher.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (mMyCdps.count < 1) {
            return 1
        } else {
            return mMyCdps.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (mMyCdps.count < 1) {
            let cell:CdpListPromotionCell? = tableView.dequeueReusableCell(withIdentifier:"CdpListPromotionCell") as? CdpListPromotionCell
            return cell!
            
        } else {
            let mCdp = mMyCdps[indexPath.row]
            let cDenom = mCdp.result.cdp.getcDenom()
            let pDenom = mCdp.result.cdp.getpDenom()
            let cParam = mCdpParam.result.getcParam(cDenom)
            let mPrice = mKavaPrice[mCdp.result.cdp.getcDenom()]
            
            print("getEstimatedTotalDebt ", mCdp.result.cdp.getEstimatedTotalDebt(cParam!))
            
            let currentPrice = NSDecimalNumber.init(string: mPrice?.result.price)
            let liquidationPrice = mCdp.result.getLiquidationPrice(cDenom, pDenom, cParam!)
            let riskRate = NSDecimalNumber.init(string: "100").subtracting(currentPrice.subtracting(liquidationPrice).multiplying(byPowerOf10: 2).dividing(by: currentPrice, withBehavior: WUtils.handler2Down))
            print("currentPrice ", currentPrice)
            print("liquidationPrice ", liquidationPrice)
            print("riskRate ", riskRate)
            
            let cell:CdpLisyMyCell? = tableView.dequeueReusableCell(withIdentifier:"CdpLisyMyCell") as? CdpLisyMyCell
            cell?.marketTitle.text = cParam!.getDpMarketId()
            WUtils.showRiskRate(riskRate, cell!.riskScore, _rateIamg: cell!.riskRateImg)
            
            cell?.debtValueTitle.text = String(format: NSLocalizedString("debt_value_format", comment: ""), pDenom.uppercased())
            cell?.debtValue.attributedText = WUtils.getDPRawDollor(mCdp.result.getDpEstimatedTotalDebtValue(pDenom, cParam!).stringValue, 2, cell!.debtValue.font)
            
            cell?.collateralValueTitle.text = String(format: NSLocalizedString("collateral_value_format", comment: ""), cDenom.uppercased())
            print("getDpCollateralValue ", mCdp.result.getDpCollateralValue(cDenom).stringValue)
            cell?.collateralValue.attributedText = WUtils.getDPRawDollor(mCdp.result.getDpCollateralValue(pDenom).stringValue, 2, cell!.collateralValue.font)
            
            cell?.currentPriceTitle.text = String(format: NSLocalizedString("current_price_format", comment: ""), cDenom.uppercased())
            cell?.currentPrice.attributedText = WUtils.getDPRawDollor(currentPrice.stringValue, 4, cell!.currentPrice.font)
            
            cell?.liquidationPriceTitle.text = String(format: NSLocalizedString("liquidation_price_format", comment: ""), cDenom.uppercased())
            cell?.liquidationPrice.attributedText = WUtils.getDPRawDollor(liquidationPrice.stringValue, 4, cell!.liquidationPrice.font)
            
            
            let url = KAVA_CDP_MARKET_IMG_URL + cParam!.getMarketImgPath() + ".png"
            Alamofire.request(url, method: .get).responseImage { response  in
                guard let image = response.result.value else {
                    return
                }
                cell?.marketImg.image = image
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (mMyCdps.count < 1) {
            return
        } else {
            let mCdp = mMyCdps[indexPath.row]
            let cdpDetailVC = CdpDetailViewController(nibName: "CdpDetailViewController", bundle: nil)
            cdpDetailVC.hidesBottomBarWhenPushed = true
            cdpDetailVC.cDenom = mCdp.result.cdp.getcDenom()
            cdpDetailVC.mMarketID = mCdp.result.cdp.getMarketId()
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(cdpDetailVC, animated: true)
        }
    }
    
    func sortByCdpId() {
        mMyCdps.sort {
            return $0.result.cdp.getCdpId() > $1.result.cdp.getCdpId()
        }
    }
}
