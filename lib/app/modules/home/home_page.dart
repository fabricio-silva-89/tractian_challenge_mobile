import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/helpers/helpers.dart';
import '../../../ui/theme/theme.dart';
import '../../../ui/widgets/widgets.dart';
import './home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with StateManagerViewMixin, UIMessageMixin {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ever(controller.errorMessage, (error) {
        if (error != null) showError(context, error);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.logo),
        centerTitle: true,
      ),
      body: builder(
        controller,
        initialOrLoading: LoadingWidget(),
        error: LoadingWidget(),
        success: _SuccessWidget(),
      ),
    );
  }
}

class _SuccessWidget extends GetView<HomeController> {
  const _SuccessWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView.separated(
        itemCount: controller.companies.length,
        separatorBuilder: (_, __) => const SizedBox(height: 40),
        itemBuilder: (_, i) => CompanyButtonWidget(
          companyName: controller.companies[i].name,
          onPressed: () {
            controller.onNavigateToAssets(controller.companies[i].id);
          },
        ),
      ),
    );
  }
}
