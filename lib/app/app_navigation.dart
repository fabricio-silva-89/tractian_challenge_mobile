import 'package:get/get.dart';

class AppNavigation {
  AppNavigation._();

  static Future<dynamic>? push({
    required String route,
    dynamic args,
  }) {
    return Get.toNamed(route, arguments: args);
  }
}
