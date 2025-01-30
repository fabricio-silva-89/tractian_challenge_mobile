import 'package:get/get.dart';

import '../../factories/repositories/repositories.dart';
import './assets_controller.dart';

class AssetsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      AssetsController(
        companiesRepository: makeCompanyRepository(),
      ),
    );
  }
}
