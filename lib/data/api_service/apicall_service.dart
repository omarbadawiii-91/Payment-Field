import 'package:dio/dio.dart';
import 'package:payment/data/repo/services/services_methods.dart';

class ApicallService extends ServicesMethods {
  ApicallService({required this.dio});
  final Dio dio;

  @override
  Future<Response> post({
    required String url,
    body,
    required String token,
    String? contentType,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': contentType ?? Headers.formUrlEncodedContentType,
        },
      ),
    );
  }
}
