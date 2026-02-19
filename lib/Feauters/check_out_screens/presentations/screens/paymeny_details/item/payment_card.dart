import 'package:flutter/material.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/paymeny_details/item/cards.dart';

// ignore: must_be_immutable
class PaymentCards extends StatefulWidget {
    PaymentCards({super.key, this.updatepaymentmethod});
    Function({required int index, required int isactive})? updatepaymentmethod;
  @override
  State<PaymentCards> createState() => _PaymentCardsState();
}

class _PaymentCardsState extends State<PaymentCards> {
  List<String> cardNames = [
    'asset/images/paypal.svg',
    'asset/images/card.svg',
  ];

  int isactive = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardNames.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                isactive = index;
                setState(() {});
                widget.updatepaymentmethod!(index: isactive, isactive: isactive);
              },
              child: Cards(
                
                isactive: isactive,
                cardNames: cardNames,
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}
