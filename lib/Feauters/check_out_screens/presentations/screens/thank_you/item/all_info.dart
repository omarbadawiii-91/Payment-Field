import 'package:flutter/material.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/constant_widget.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/thank_you/item/mark_down_card.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/thank_you/item/text_screen.dart';

class All_info extends StatelessWidget {
  const All_info({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Thank You!", style: ConstantStyle.style25),
        const SizedBox(height: 20),
        const Text(
          "Your order has been placed successfully.",
          style: TextStyle(fontSize: 20, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        ComponentthankyouScreen(
          info: "01/01/2023",
          name: "Date:",
          style: ConstantStyle.style18,
        ),
        ComponentthankyouScreen(
          info: "12:00 PM",
          name: "Time:",
          style: ConstantStyle.style18,
        ),
        ComponentthankyouScreen(
          info: "Omar Badawy",
          name: "To:",
          style: ConstantStyle.style18,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 320,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: const Color(0xFFC6C6C6),
                ),
              ),
            ),
          ),
        ),
        ComponentthankyouScreen(
          info: "\$42.97",
          name: "Total:",
          style: ConstantStyle.style24,
        ),
        SizedBox(height: 80),
        Container(
          width: 300,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: const Color(0xFFB7B7B7),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Markdown(),
        ),
      ],
    );
  }
}
