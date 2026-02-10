import 'package:flutter/material.dart';

class Markdown extends StatelessWidget {
  const Markdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          image: AssetImage("asset/images/SVGRepo_iconCarrier.png"),
          width: 150,
        ),
        Container(
          width: 113,
          height: 58,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.50,
                color: const Color(0xFF34A853),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              'PAID',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF34A853),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
