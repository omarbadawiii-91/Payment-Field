import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/thank_you/item/thank_you_card.dart';

class BodyOfThank extends StatelessWidget {
  const BodyOfThank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            GoRouter.of(context).go("/");
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 37),
              child: const Thankyoucard(),
            ),
            Positioned(
              left: 150,
              top: -20,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: const Color(0xFFD9D9D9),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xFF4CAF50),
                  child: const Icon(Icons.check, color: Colors.white, size: 50),
                ),
              ),
            ),
            Positioned(
              left: 28,
              bottom: 150,
              child: Container(
                width: 35,
                height: 35,
                decoration: ShapeDecoration(
                  color: const Color(0xffFEF7FF),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              right: -10,
              bottom: 150,
              child: Container(
                width: 35,
                height: 35,
                decoration: ShapeDecoration(
                  color: const Color(0xffFEF7FF),
                  shape: OvalBorder(),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}