package wannabit.io.cosmostaion.task;

import retrofit2.Response;
import wannabit.io.cosmostaion.base.BaseApplication;
import wannabit.io.cosmostaion.base.BaseConstant;
import wannabit.io.cosmostaion.dao.Account;
import wannabit.io.cosmostaion.network.ApiClient;
import wannabit.io.cosmostaion.network.res.ResLcdBondings;
import wannabit.io.cosmostaion.utils.WLog;
import wannabit.io.cosmostaion.utils.WUtil;

public class SingleSelfBondingStateTask extends CommonTask {

    private String  mDelegateAddr;
    private String  mValidatorAddr;

    public SingleSelfBondingStateTask(BaseApplication app, TaskListener listener, String delegateAddr, String validatorAddr) {
        super(app, listener);
        this.mResult.taskType   = BaseConstant.TASK_FETCH_SINGLE_SELF_BONDING;
        this.mDelegateAddr = delegateAddr;
        this.mValidatorAddr = validatorAddr;
    }

    @Override
    protected TaskResult doInBackground(String... strings) {
        try {
            Response<ResLcdBondings> response = ApiClient.getWannabitChain(mApp).getBonding(mDelegateAddr, mValidatorAddr).execute();
            if(response.isSuccessful() && response.body() != null) {
                mResult.resultData = response.body();
                mResult.isSuccess = true;
            }


        } catch (Exception e) {
            WLog.w("SingleBondingStateTask Error " + e.getMessage());
        }
        return mResult;
    }
}