class PaymentIntentInputSheet {
  final String amount;
  final String currency;
  final String ?customerId;
  PaymentIntentInputSheet({
    required this.amount,
    required this.currency,
     this.customerId,
  });

  Map<String, dynamic> tojson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerId,
    };
  }
}
