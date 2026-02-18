import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/button.dart';
import 'package:payment/Feauters/check_out_screens/presentations/repeated_widgets/constant_widget.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/paymeny_details/item/creditcards.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/paymeny_details/item/payment_card.dart';

// ignore: must_be_immutable
class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            GoRouter.of(context).go("/");
          },
          child: SvgPicture.asset("asset/images/Arrow 1.svg", width: 30),
        ),
        title: const Text(
          'Payment Details',
          textAlign: TextAlign.center,
          style: ConstantStyle.style25,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: PaymentCards()),
            SliverToBoxAdapter(child: SizedBox(height: 36)),
            SliverToBoxAdapter(
              child: Creditcards(
                formKey: formKey,
                autovalidateMode: autovalidateMode,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                child: Button(
                  nameofbutton: "Pay",
                  styleofbutton: ConstantStyle.style22,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      autovalidateMode = AutovalidateMode.disabled;
                      GoRouter.of(context).go("/thankyou");
                      setState(() {});
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
