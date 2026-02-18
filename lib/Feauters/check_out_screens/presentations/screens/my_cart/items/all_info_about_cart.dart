import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/Button.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/constant_widget.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/my_cart/items/payment_method_bottom_sheet.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/my_cart/items/texts_screen_of_cart.dart';
import 'package:payment/data/manger/cubit/payment_gateway_cubit.dart';
import 'package:payment/data/repo/check_out_repo_imple.dart';

class all_info_about_cart extends StatelessWidget {
  const all_info_about_cart({super.key});

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
        Button(
          nameofbutton: "Complete Payment",
          styleofbutton: ConstantStyle.style22,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => PaymentGatewayCubit(CheckOutRepoImple()),
                  child: PaymentMethods(),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
