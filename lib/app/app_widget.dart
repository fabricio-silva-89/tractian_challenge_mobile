import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/theme/theme.dart';
import 'app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TRACTIAN',
      theme: makeThemeData(),
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.home,
      debugShowCheckedModeBanner: false,
    );
  }
}
