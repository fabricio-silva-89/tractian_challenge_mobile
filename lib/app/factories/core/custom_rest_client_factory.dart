import '../../../core/rest_client/custom_rest_client.dart';

CustomRestClient makeCustomRestClient(String baseUrl) {
  return CustomRestClient(baseUrl: baseUrl);
}
