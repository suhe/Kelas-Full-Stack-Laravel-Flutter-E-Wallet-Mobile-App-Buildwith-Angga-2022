class TransferFormModel {
  final String? amount;
  final String? pin;
  final String? sendTo;

  TransferFormModel({this.amount, this.pin, this.sendTo});

  TransferFormModel copywith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) {
    return TransferFormModel(
      amount: amount ?? this.amount,
      pin: pin ?? this.pin,
      sendTo: paymentMethodCode ?? this.sendTo,
    );
  }

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'pin': pin,
    'sned_to': sendTo,
  };
}
