import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/button.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/constant_widget.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/paymeny_details/item/payment_card.dart';
import 'package:payment/data/manger/cubit/payment_gateway_cubit.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: PaymentCards(),
        ),
        SizedBox(height: 30),
        BlocConsumer<PaymentGatewayCubit, PaymentGatewayState>(
          listener: (context, state) {
            if (state is PaymentGatewaySuccess) {
              GoRouter.of(context).go("/thankyou");
            }
            if (state is PaymentGatewayFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Button(
              isloading: state is PaymentGatewayLoading ? true : false,
              nameofbutton: "Continue",
              styleofbutton: ConstantStyle.style22,
              onPressed: () {
                BlocProvider.of<PaymentGatewayCubit>(context).checkOut(
                  paymentIntent: PaymentIntentInputSheet(
                    amount: "200",
                    currency: "USD",
                  ),
                );
              },
            );
          },
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
