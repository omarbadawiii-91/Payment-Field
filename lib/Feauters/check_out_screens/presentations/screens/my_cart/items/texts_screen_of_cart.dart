import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ComponentCartScreen extends StatelessWidget {
  ComponentCartScreen({
    super.key,
    required this.salary,
    required this.name,
    required this.style,
  });
  String salary;
  String name;
  TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: style),
          Text(salary, style: style),
        ],
      ),
    );
  }
}
