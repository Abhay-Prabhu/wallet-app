// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Balance {
    String? status;
    String? message;
    int? balance;

    Balance({
        this.status,
        this.message,
        this.balance,
    });


  Balance copyWith({
    String? status,
    String? message,
    int? balance,
  }) {
    return Balance(
      status: status ?? this.status,
      message: message ?? this.message,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'balance': balance,
    };
  }

  factory Balance.fromMap(Map<String, dynamic> map) {
    return Balance(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      balance: map['balance'] != null ? map['balance'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Balance.fromJson(String source) => Balance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Balance(status: $status, message: $message, balance: $balance)';

  @override
  bool operator ==(covariant Balance other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      other.balance == balance;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ balance.hashCode;
}
