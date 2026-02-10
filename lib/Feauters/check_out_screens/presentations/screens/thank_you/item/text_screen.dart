import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ComponentthankyouScreen extends StatelessWidget {
  ComponentthankyouScreen({
    super.key,
    required this.info,
    required this.name,
    required this.style,
  });
  String info;
  String name;
  TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: style),
          Text(info, style: style),
        ],
      ),
    );
  }
}