part of 'payment_gateway_cubit.dart';

@immutable
sealed class PaymentGatewayState {}

final class PaymentGatewayInitial extends PaymentGatewayState {}

final class PaymentGatewaySuccess extends PaymentGatewayState {}

final class PaymentGatewayFailure extends PaymentGatewayState {
  final String message;
  PaymentGatewayFailure(this.message);
}

final class PaymentGatewayLoading extends PaymentGatewayState {}
