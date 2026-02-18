// ignore_for_file: strict_top_level_inference

abstract class ServicesMethods {
  post({
    required String url,
     body,
    required String token,
    String? contentType,
    Map<String, dynamic>? queryParameters,
    
  });
}
