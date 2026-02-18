import 'package:dartz/dartz.dart';
import 'package:payment/data/failures/failures.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';

abstract class CheckOutRepo {
  Future<Either<Failures, void>> checkOut({
    PaymentIntentInputSheet? paymentIntent,
  });
}
