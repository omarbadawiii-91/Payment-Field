import 'package:flutter/material.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/Button.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/constant_widget.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/my_cart/items/texts_screen_of_cart.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/paymeny_details/item/payment_card.dart';

class all_info_about_cart extends StatelessWidget {
  const all_info_about_cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("asset/images/Group 7.png", width: 400, height: 400),
        SizedBox(height: 25),
        ComponentCartScreen(
          name: "Order Subtotal",
          salary: "\$42.97",
          style: ConstantStyle.style18,
        ),
        SizedBox(height: 15),
        ComponentCartScreen(
          name: "Discount",
          salary: "\$0",
          style: ConstantStyle.style18,
        ),
        SizedBox(height: 15),
        ComponentCartScreen(
          name: "Shipping",
          salary: "\$8.0",
          style: ConstantStyle.style18,
        ),
        SizedBox(height: 30),
        Container(
          width: 320,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: const Color(0xFFC6C6C6),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        ComponentCartScreen(
          name: "Total",
          salary: "\$50.97",
          style: ConstantStyle.style24,
        ),
        SizedBox(height: 30),
        Button(nameofbutton: "Complete Payment",styleofbutton: ConstantStyle.style22,
         onPressed: () { 
          showModalBottomSheet(context: context, builder: (context) {
            return PaymentMethods();
          });

         })
      ],
    );
  }
}
class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: PaymentCards(),
        ),
          SizedBox(height: 30),
          Button(nameofbutton: "Continue", styleofbutton: ConstantStyle.style22, onPressed: (){}),
          SizedBox(height: 40),
      ],
    );
  }
}