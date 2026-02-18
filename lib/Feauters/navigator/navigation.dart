import 'package:go_router/go_router.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/my_cart/my_cart.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/paymeny_details/body_of_screen.dart';
import 'package:payment/Feauters/check_out_screens/presentations/screens/thank_you/body_of_thank.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MyCart()),
    GoRoute(path: '/payment', builder: (context, state) => PaymentScreen()),
    GoRoute(
      path: '/thankyou',
      builder: (context, state) => const BodyOfThank(),
    ),
  ],
);
