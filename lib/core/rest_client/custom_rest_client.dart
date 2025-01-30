import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class CustomRestClient extends DioForNative {
  final String baseUrl;

  CustomRestClient({required this.baseUrl})
      : super(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 300),
            responseType: ResponseType.plain,
            headers: {'content-type': 'application/json'},
          ),
        );

  CustomRestClient client() {
    return this;
  }
}
