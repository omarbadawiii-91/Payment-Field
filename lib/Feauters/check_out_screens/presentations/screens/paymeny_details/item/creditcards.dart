import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

// ignore: must_be_immutable
class Creditcards extends StatefulWidget {
  Creditcards({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
  });
  GlobalKey<FormState> formKey;
  AutovalidateMode autovalidateMode;
  @override
  State<Creditcards> createState() => _CreditcardsState();
}

class _CreditcardsState extends State<Creditcards> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showbackview = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showbackview,
            onCreditCardWidgetChange: (value) {},
            isHolderNameVisible: true,
          ),
          CreditCardForm(
            autovalidateMode: widget.autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (creditcardmodel) {
              cardNumber = creditcardmodel.cardNumber;
              expiryDate = creditcardmodel.expiryDate;
              cardHolderName = creditcardmodel.cardHolderName;
              cvvCode = creditcardmodel.cvvCode;
              showbackview = creditcardmodel.isCvvFocused;
              setState(() {});
            },
            formKey: widget.formKey,
          ),
        ],
      ),
    );
  }
}
