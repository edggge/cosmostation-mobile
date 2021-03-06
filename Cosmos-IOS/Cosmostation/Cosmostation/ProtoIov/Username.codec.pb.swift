// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cmd/bnsd/x/username/codec.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Token model represents a username mapping to an address together with all
/// metadata.
///
/// Each Token model is stored using the username as the key. This guarantee
/// that the name is unique. Username is a combination of a name and a domain.
/// The format is <name>*<domain>
///
/// Each token points to a blockchain and an address on that blockchain. Both
/// blockchain ID and address are an arbitrary string as we do not want to limit
/// ourselves to certain patterns.
struct Username_Token {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var metadata: Weave_Metadata {
    get {return _storage._metadata ?? Weave_Metadata()}
    set {_uniqueStorage()._metadata = newValue}
  }
  /// Returns true if `metadata` has been explicitly set.
  var hasMetadata: Bool {return _storage._metadata != nil}
  /// Clears the value of `metadata`. Subsequent reads from it will return its default value.
  mutating func clearMetadata() {_uniqueStorage()._metadata = nil}

  /// Targets specifies where this username token points to. This must be at
  /// least one blockchain address elemenet.
  var targets: [Username_BlockchainAddress] {
    get {return _storage._targets}
    set {_uniqueStorage()._targets = newValue}
  }

  /// Owner is a weave.Address that controls this token. Only the owner can
  /// modify a username token.
  var owner: Data {
    get {return _storage._owner}
    set {_uniqueStorage()._owner = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// BlockchainAddress represents a blochain address. This structure clubs together
/// blokchain ID together with an address on that network. It is used to point
/// to an address on any blockchain network.
struct Username_BlockchainAddress {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// An arbitrary blockchain ID.
  var blockchainID: String = String()

  /// An address on the specified blockchain network. Address is not a
  /// weave.Address as we cannot know what is the format of an address on the
  /// chain that this token instance links to. Because we do not know the rules
  /// to validate an address for any blockchain ID, this is an arbitrary bulk of
  /// data.
  /// It is more convinient to always use encoded representation of each address
  /// and store it as a string. Using bytes while compact is not as comfortable
  /// to use.
  var address: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// RegisterTokenMsg is creating a new username token. The owner is always set
/// to the main signer.
struct Username_RegisterTokenMsg {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var metadata: Weave_Metadata {
    get {return _storage._metadata ?? Weave_Metadata()}
    set {_uniqueStorage()._metadata = newValue}
  }
  /// Returns true if `metadata` has been explicitly set.
  var hasMetadata: Bool {return _storage._metadata != nil}
  /// Clears the value of `metadata`. Subsequent reads from it will return its default value.
  mutating func clearMetadata() {_uniqueStorage()._metadata = nil}

  /// Username is the unique name of the token, for example alice*iov
  var username: String {
    get {return _storage._username}
    set {_uniqueStorage()._username = newValue}
  }

  /// Targets is a blockchain address list that this token should point to.
  var targets: [Username_BlockchainAddress] {
    get {return _storage._targets}
    set {_uniqueStorage()._targets = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// TransferTokenMsg is a request to transfer an ownership of a token. The
/// mesage must be signed by the current token owner. Acceptance of the new
/// owner is not required in order to succeed.
struct Username_TransferTokenMsg {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var metadata: Weave_Metadata {
    get {return _storage._metadata ?? Weave_Metadata()}
    set {_uniqueStorage()._metadata = newValue}
  }
  /// Returns true if `metadata` has been explicitly set.
  var hasMetadata: Bool {return _storage._metadata != nil}
  /// Clears the value of `metadata`. Subsequent reads from it will return its default value.
  mutating func clearMetadata() {_uniqueStorage()._metadata = nil}

  /// Username is the unique name of the token, for example alice*iov
  var username: String {
    get {return _storage._username}
    set {_uniqueStorage()._username = newValue}
  }

  /// Owner is a weave address that will owns this token after the change.
  var newOwner: Data {
    get {return _storage._newOwner}
    set {_uniqueStorage()._newOwner = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// ChangeTokenTargetsMsg is a request to change the address that this token
/// points to. Only the owner of a token can request this operation.
struct Username_ChangeTokenTargetsMsg {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var metadata: Weave_Metadata {
    get {return _storage._metadata ?? Weave_Metadata()}
    set {_uniqueStorage()._metadata = newValue}
  }
  /// Returns true if `metadata` has been explicitly set.
  var hasMetadata: Bool {return _storage._metadata != nil}
  /// Clears the value of `metadata`. Subsequent reads from it will return its default value.
  mutating func clearMetadata() {_uniqueStorage()._metadata = nil}

  /// Username is the unique name of the token, for example alice*iov
  var username: String {
    get {return _storage._username}
    set {_uniqueStorage()._username = newValue}
  }

  /// New targets is a list of blockchain addresses that this token should point
  /// to after the change. Old list is overwritten with what is provided.
  var newTargets: [Username_BlockchainAddress] {
    get {return _storage._newTargets}
    set {_uniqueStorage()._newTargets = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Configuration is a dynamic configuration used by this extension, managed by
/// the functionality provided by gconf package.
struct Username_Configuration {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var metadata: Weave_Metadata {
    get {return _storage._metadata ?? Weave_Metadata()}
    set {_uniqueStorage()._metadata = newValue}
  }
  /// Returns true if `metadata` has been explicitly set.
  var hasMetadata: Bool {return _storage._metadata != nil}
  /// Clears the value of `metadata`. Subsequent reads from it will return its default value.
  mutating func clearMetadata() {_uniqueStorage()._metadata = nil}

  /// Owner is present to implement gconf.OwnedConfig interface
  /// This defines the Address that is allowed to update the Configuration object and is
  /// needed to make use of gconf.NewUpdateConfigurationHandler
  var owner: Data {
    get {return _storage._owner}
    set {_uniqueStorage()._owner = newValue}
  }

  /// Valid username name defines a regular expression that every valid username
  /// part name must match (a username is <name>*<label>)
  var validUsernameName: String {
    get {return _storage._validUsernameName}
    set {_uniqueStorage()._validUsernameName = newValue}
  }

  /// Valid username label defines a regular expression that every valid
  /// namespace label must match (a username is <name>*<label>)
  var validUsernameLabel: String {
    get {return _storage._validUsernameLabel}
    set {_uniqueStorage()._validUsernameLabel = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// UpdateConfigurationMsg is used by the gconf extension to update the
/// configuration.
struct Username_UpdateConfigurationMsg {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var metadata: Weave_Metadata {
    get {return _storage._metadata ?? Weave_Metadata()}
    set {_uniqueStorage()._metadata = newValue}
  }
  /// Returns true if `metadata` has been explicitly set.
  var hasMetadata: Bool {return _storage._metadata != nil}
  /// Clears the value of `metadata`. Subsequent reads from it will return its default value.
  mutating func clearMetadata() {_uniqueStorage()._metadata = nil}

  var patch: Username_Configuration {
    get {return _storage._patch ?? Username_Configuration()}
    set {_uniqueStorage()._patch = newValue}
  }
  /// Returns true if `patch` has been explicitly set.
  var hasPatch: Bool {return _storage._patch != nil}
  /// Clears the value of `patch`. Subsequent reads from it will return its default value.
  mutating func clearPatch() {_uniqueStorage()._patch = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "username"

extension Username_Token: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Token"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "metadata"),
    2: .same(proto: "targets"),
    3: .same(proto: "owner"),
  ]

  fileprivate class _StorageClass {
    var _metadata: Weave_Metadata? = nil
    var _targets: [Username_BlockchainAddress] = []
    var _owner: Data = SwiftProtobuf.Internal.emptyData

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _metadata = source._metadata
      _targets = source._targets
      _owner = source._owner
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._metadata)
        case 2: try decoder.decodeRepeatedMessageField(value: &_storage._targets)
        case 3: try decoder.decodeSingularBytesField(value: &_storage._owner)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._metadata {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._targets.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._targets, fieldNumber: 2)
      }
      if !_storage._owner.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._owner, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Username_Token, rhs: Username_Token) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._metadata != rhs_storage._metadata {return false}
        if _storage._targets != rhs_storage._targets {return false}
        if _storage._owner != rhs_storage._owner {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Username_BlockchainAddress: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BlockchainAddress"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "blockchain_id"),
    2: .same(proto: "address"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.blockchainID)
      case 2: try decoder.decodeSingularStringField(value: &self.address)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.blockchainID.isEmpty {
      try visitor.visitSingularStringField(value: self.blockchainID, fieldNumber: 1)
    }
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Username_BlockchainAddress, rhs: Username_BlockchainAddress) -> Bool {
    if lhs.blockchainID != rhs.blockchainID {return false}
    if lhs.address != rhs.address {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Username_RegisterTokenMsg: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RegisterTokenMsg"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "metadata"),
    2: .same(proto: "username"),
    3: .same(proto: "targets"),
  ]

  fileprivate class _StorageClass {
    var _metadata: Weave_Metadata? = nil
    var _username: String = String()
    var _targets: [Username_BlockchainAddress] = []

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _metadata = source._metadata
      _username = source._username
      _targets = source._targets
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._metadata)
        case 2: try decoder.decodeSingularStringField(value: &_storage._username)
        case 3: try decoder.decodeRepeatedMessageField(value: &_storage._targets)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._metadata {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._username.isEmpty {
        try visitor.visitSingularStringField(value: _storage._username, fieldNumber: 2)
      }
      if !_storage._targets.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._targets, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Username_RegisterTokenMsg, rhs: Username_RegisterTokenMsg) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._metadata != rhs_storage._metadata {return false}
        if _storage._username != rhs_storage._username {return false}
        if _storage._targets != rhs_storage._targets {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Username_TransferTokenMsg: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TransferTokenMsg"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "metadata"),
    2: .same(proto: "username"),
    3: .standard(proto: "new_owner"),
  ]

  fileprivate class _StorageClass {
    var _metadata: Weave_Metadata? = nil
    var _username: String = String()
    var _newOwner: Data = SwiftProtobuf.Internal.emptyData

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _metadata = source._metadata
      _username = source._username
      _newOwner = source._newOwner
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._metadata)
        case 2: try decoder.decodeSingularStringField(value: &_storage._username)
        case 3: try decoder.decodeSingularBytesField(value: &_storage._newOwner)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._metadata {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._username.isEmpty {
        try visitor.visitSingularStringField(value: _storage._username, fieldNumber: 2)
      }
      if !_storage._newOwner.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._newOwner, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Username_TransferTokenMsg, rhs: Username_TransferTokenMsg) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._metadata != rhs_storage._metadata {return false}
        if _storage._username != rhs_storage._username {return false}
        if _storage._newOwner != rhs_storage._newOwner {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Username_ChangeTokenTargetsMsg: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChangeTokenTargetsMsg"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "metadata"),
    2: .same(proto: "username"),
    3: .standard(proto: "new_targets"),
  ]

  fileprivate class _StorageClass {
    var _metadata: Weave_Metadata? = nil
    var _username: String = String()
    var _newTargets: [Username_BlockchainAddress] = []

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _metadata = source._metadata
      _username = source._username
      _newTargets = source._newTargets
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._metadata)
        case 2: try decoder.decodeSingularStringField(value: &_storage._username)
        case 3: try decoder.decodeRepeatedMessageField(value: &_storage._newTargets)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._metadata {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._username.isEmpty {
        try visitor.visitSingularStringField(value: _storage._username, fieldNumber: 2)
      }
      if !_storage._newTargets.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._newTargets, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Username_ChangeTokenTargetsMsg, rhs: Username_ChangeTokenTargetsMsg) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._metadata != rhs_storage._metadata {return false}
        if _storage._username != rhs_storage._username {return false}
        if _storage._newTargets != rhs_storage._newTargets {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Username_Configuration: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Configuration"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "metadata"),
    2: .same(proto: "owner"),
    3: .standard(proto: "valid_username_name"),
    4: .standard(proto: "valid_username_label"),
  ]

  fileprivate class _StorageClass {
    var _metadata: Weave_Metadata? = nil
    var _owner: Data = SwiftProtobuf.Internal.emptyData
    var _validUsernameName: String = String()
    var _validUsernameLabel: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _metadata = source._metadata
      _owner = source._owner
      _validUsernameName = source._validUsernameName
      _validUsernameLabel = source._validUsernameLabel
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._metadata)
        case 2: try decoder.decodeSingularBytesField(value: &_storage._owner)
        case 3: try decoder.decodeSingularStringField(value: &_storage._validUsernameName)
        case 4: try decoder.decodeSingularStringField(value: &_storage._validUsernameLabel)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._metadata {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._owner.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._owner, fieldNumber: 2)
      }
      if !_storage._validUsernameName.isEmpty {
        try visitor.visitSingularStringField(value: _storage._validUsernameName, fieldNumber: 3)
      }
      if !_storage._validUsernameLabel.isEmpty {
        try visitor.visitSingularStringField(value: _storage._validUsernameLabel, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Username_Configuration, rhs: Username_Configuration) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._metadata != rhs_storage._metadata {return false}
        if _storage._owner != rhs_storage._owner {return false}
        if _storage._validUsernameName != rhs_storage._validUsernameName {return false}
        if _storage._validUsernameLabel != rhs_storage._validUsernameLabel {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Username_UpdateConfigurationMsg: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UpdateConfigurationMsg"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "metadata"),
    2: .same(proto: "patch"),
  ]

  fileprivate class _StorageClass {
    var _metadata: Weave_Metadata? = nil
    var _patch: Username_Configuration? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _metadata = source._metadata
      _patch = source._patch
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._metadata)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._patch)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._metadata {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._patch {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Username_UpdateConfigurationMsg, rhs: Username_UpdateConfigurationMsg) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._metadata != rhs_storage._metadata {return false}
        if _storage._patch != rhs_storage._patch {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
