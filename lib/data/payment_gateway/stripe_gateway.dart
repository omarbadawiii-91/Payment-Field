import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/data/api_service/apicall_service.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';
import 'package:payment/data/models/payment_intent_sheet/payment_intent_sheet.dart';
import 'package:payment/data/repo/services/api_keys.dart';
import 'package:payment/data/repo/services/services_methods.dart';

class StripeGateway {
  ServicesMethods servicesMethods = ApicallService(dio: Dio());
  Future<PaymentIntentSheet?> createPaymentIntent(
    PaymentIntentInputSheet paymentIntent,
  ) async {
    var respone = await servicesMethods.post(
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/payment_intents",
      body: paymentIntent.tojson(),
      token: ApiKeys.token,
    );

    var paymentIntentSheet = PaymentIntentSheet.fromJson(respone.data);
    return paymentIntentSheet;
  }

  Future initPaymentSheet({required String paymentintentclientsecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customerId: ApiKeys.customid,
        paymentIntentClientSecret: paymentintentclientsecret,
        merchantDisplayName: ApiKeys.merchentdispalyname,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePaymentSheet({
    required PaymentIntentInputSheet paymentIntent,
  }) async {
    var paymentIntentSheet = await createPaymentIntent(paymentIntent);
    await initPaymentSheet(
      paymentintentclientsecret: paymentIntentSheet!.clientSecret!,
    );
    await displayPaymentSheet();
  }
 /* Future<CustomerSession> createCustomsession(
   String customerId,
  ) async {
    var respone = await servicesMethods.post(
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/customer_sessions?",
      queryParameters: {
        "customer": ApiKeys.customid,
      },
      token: ApiKeys.token,
    );

    var customersession = CustomerSession.fromJson(respone.data);
    return customersession;
  }*/
}

