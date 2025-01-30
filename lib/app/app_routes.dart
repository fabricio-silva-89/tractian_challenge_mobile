import 'package:get/get.dart';

import 'modules/modules.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String assets = '/assets';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: assets,
      page: () => const AssetsPage(),
      binding: AssetsBindings(),
    ),
  ];
}
