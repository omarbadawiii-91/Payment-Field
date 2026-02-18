import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';
import 'package:payment/data/repo/check_out_repo.dart';

part 'payment_gateway_state.dart';

class PaymentGatewayCubit extends Cubit<PaymentGatewayState> {
  PaymentGatewayCubit(this.checkOutRepo) : super(PaymentGatewayInitial());
  final CheckOutRepo checkOutRepo;

  void checkOut({required PaymentIntentInputSheet? paymentIntent}) async {
    emit(PaymentGatewayLoading());
    final result = await checkOutRepo.checkOut(paymentIntent: paymentIntent);
    result.fold(
      (l) => emit(PaymentGatewayFailure(l.message)),
      (r) => emit(PaymentGatewaySuccess()),
    );
  }
}
