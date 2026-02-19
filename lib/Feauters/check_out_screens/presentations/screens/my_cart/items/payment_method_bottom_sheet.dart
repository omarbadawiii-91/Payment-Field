import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/button.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/constant_widget.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/paymeny_details/item/payment_card.dart';
import 'package:payment/data/manger/cubit/payment_gateway_cubit.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';
import 'package:payment/data/payment_gateway/paypal/payment_methods/execute_paypal_payments.dart';

class PaymentMethods extends StatefulWidget {
   const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  bool ispaypal = false;

  Allmethods allmethods = Allmethods();
  void updatepaymentmethod({required int index, required int isactive}){
    if(index == 0){
      ispaypal = true;
    }
    else{
      ispaypal = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: PaymentCards(updatepaymentmethod: updatepaymentmethod),
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
                if(ispaypal){ allmethods.excute_paypal_payments(context);}
                else{   BlocProvider.of<PaymentGatewayCubit>(context).checkOut(
                paymentIntent: PaymentIntentInputSheet(
                 amount: "200",
                  currency: "USD",
                ),
                );
}

             
              },
            );
          },
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
