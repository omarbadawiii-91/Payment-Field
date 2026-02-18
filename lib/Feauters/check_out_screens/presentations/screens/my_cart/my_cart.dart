import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/constant_widget.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/my_cart/items/body_of_cart.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {},
          child: SvgPicture.asset("asset/images/Arrow 1.svg", width: 30),
        ),
        title: const Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: ConstantStyle.style25,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: BodyOfCart(),
            ),
          ),
        ],
      ),
    );
  }
}
