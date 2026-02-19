import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/thank_you/item/thank_you_card.dart';
import 'package:payment/data/payment_gateway/paypal/models/amount/amount.dart';
import 'package:payment/data/payment_gateway/paypal/models/amount/details.dart';
import 'package:payment/data/payment_gateway/paypal/models/items/item.dart';
import 'package:payment/data/payment_gateway/paypal/models/items/items.dart';
import 'package:payment/data/repo/services/api_keys.dart';

 class Allmethods {
   void excute_paypal_payments(BuildContext context) {
    var data = getdataTransactions();
                    Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientid,
        secretKey: ApiKeys.secretkeypaypal,
        transactions: [
          {
            "amount": data.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": data.items.toJson(),
          },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params" as num);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Thankyoucard()), (route) {
            if(route.settings.name=='/'){
              return true;
            }
            return false;
          });
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
          },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ),
                    );
  }

    ({AmountModel amount, Items items}) getdataTransactions() {
    var amount = AmountModel(
      currency: "USD",
      total: "70",
      details: Details(subtotal: "70", shipping: "0", shippingDiscount: 0),
    );

    List<ItemModel> itemes = [
      ItemModel(name: "Apple", quantity: 4, price: "5", currency: "USD"),
      ItemModel(name: "Pineapple", quantity: 5, price: "10", currency: "USD"),
    ];
    var items = Items(items: itemes);
    return (amount: amount, items: items);
  }
}