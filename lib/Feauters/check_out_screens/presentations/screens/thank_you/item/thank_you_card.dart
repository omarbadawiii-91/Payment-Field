import 'package:flutter/material.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/thank_you/item/all_info.dart';

class Thankyoucard extends StatelessWidget {
  const Thankyoucard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 672,
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: All_info(),
      ),
    );
  }
}
