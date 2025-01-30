import 'package:get/get.dart';

import '../../factories/repositories/company_repository_factory.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(companiesRepository: makeCompanyRepository()),
    );
  }
}
