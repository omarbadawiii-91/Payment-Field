import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.isactive,
    required this.cardNames,
    required this.index,
  });

  final int isactive;
  final List<String> cardNames;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 103,
      height: 62,
      duration: const Duration(milliseconds: 300),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.50, color: isactive == index ? const Color(0xFF34A853) : const Color.fromARGB(255, 97, 97, 97)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Container(
        width: 103,
        height: 62,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(cardNames[index], width: 103, height: 62,fit: BoxFit.scaleDown,)),
      )
    );
  }
}