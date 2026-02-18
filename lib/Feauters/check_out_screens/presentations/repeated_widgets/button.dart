import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/data/manger/cubit/payment_gateway_cubit.dart';

class Button extends StatelessWidget {
  Button({
    super.key,
    required this.nameofbutton,
    required this.styleofbutton,
    required this.onPressed,
    this.isloading = false,
  });
  final String nameofbutton;
  final TextStyle styleofbutton;
  final void Function()? onPressed;
  bool isloading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 350,
        height: 73,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isloading
              ? const CircularProgressIndicator()
              : Text(
                  nameofbutton,
                  textAlign: TextAlign.center,
                  style: styleofbutton,
                ),
        ),
      ),
    );
  }
}
