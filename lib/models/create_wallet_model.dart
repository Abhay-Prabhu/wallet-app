// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateWallet {
    String? status;
    String? message;
    String? wallet_name;
    String? userPin;
    String? network;
    String? publicKey;
    String? secretKey;

    CreateWallet({
        this.status,
        this.message,
        this.wallet_name,
        this.userPin,
        this.network,
        this.publicKey,
        this.secretKey,
    });


  CreateWallet copyWith({
    String? status,
    String? message,
    String? wallet_name,
    String? userPin,
    String? network,
    String? publicKey,
    String? secretKey,
  }) {
    return CreateWallet(
      status: status ?? this.status,
      message: message ?? this.message,
      wallet_name: wallet_name ?? this.wallet_name,
      userPin: userPin ?? this.userPin,
      network: network ?? this.network,
      publicKey: publicKey ?? this.publicKey,
      secretKey: secretKey ?? this.secretKey,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'wallet_name': wallet_name,
      'userPin': userPin,
      'network': network,
      'publicKey': publicKey,
      'secretKey': secretKey,
    };
  }

  factory CreateWallet.fromMap(Map<String, dynamic> map) {
    return CreateWallet(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      wallet_name: map['wallet_name'] != null ? map['wallet_name'] as String : null,
      userPin: map['userPin'] != null ? map['userPin'] as String : null,
      network: map['network'] != null ? map['network'] as String : null,
      publicKey: map['publicKey'] != null ? map['publicKey'] as String : null,
      secretKey: map['secretKey'] != null ? map['secretKey'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateWallet.fromJson(String source) => CreateWallet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateWallet(status: $status, message: $message, wallet_name: $wallet_name, userPin: $userPin, network: $network, publicKey: $publicKey, secretKey: $secretKey)';
  }

  @override
  bool operator ==(covariant CreateWallet other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      other.wallet_name == wallet_name &&
      other.userPin == userPin &&
      other.network == network &&
      other.publicKey == publicKey &&
      other.secretKey == secretKey;
  }

  @override
  int get hashCode {
    return status.hashCode ^
      message.hashCode ^
      wallet_name.hashCode ^
      userPin.hashCode ^
      network.hashCode ^
      publicKey.hashCode ^
      secretKey.hashCode;
  }
}
