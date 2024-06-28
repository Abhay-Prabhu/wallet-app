import 'dart:convert';

class TransferBalance {
    String? status;
    String? message;
    String? transactionId;

    TransferBalance({
        this.status,
        this.message,
        this.transactionId,
    });


  TransferBalance copyWith({
    String? status,
    String? message,
    String? transactionId,
  }) {
    return TransferBalance(
      status: status ?? this.status,
      message: message ?? this.message,
      transactionId: transactionId ?? this.transactionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'transactionId': transactionId,
    };
  }

  factory TransferBalance.fromMap(Map<String, dynamic> map) {
    return TransferBalance(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      transactionId: map['transactionId'] != null ? map['transactionId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransferBalance.fromJson(String source) => TransferBalance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TransferBalance(status: $status, message: $message, transactionId: $transactionId)';

  @override
  bool operator ==(covariant TransferBalance other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.message == message &&
      other.transactionId == transactionId;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ transactionId.hashCode;
}
