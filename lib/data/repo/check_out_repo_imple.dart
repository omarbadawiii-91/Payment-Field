import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/data/failures/failures.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';
import 'package:payment/data/repo/check_out_repo.dart';
import 'package:payment/data/payment_gateway/stripe/stripe_gateway.dart';

class CheckOutRepoImple extends CheckOutRepo {
  final StripeGateway stripeGateway = StripeGateway();
  @override
  Future<Either<Failures, void>> checkOut({
    PaymentIntentInputSheet? paymentIntent,
  }) async {
    try {
      await stripeGateway.makePaymentSheet(paymentIntent: paymentIntent!);
      return const Right(null);
    } 
    on StripeException catch (e) {
      return Left(ServerFailure(e.error.message??"Oops something went wrong"));
    }
  }
}
