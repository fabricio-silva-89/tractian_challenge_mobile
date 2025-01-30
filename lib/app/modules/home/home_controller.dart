import 'package:get/get.dart';

import '../../../core/exceptions/custom_exception.dart';
import '../../../models/model.dart';
import '../../../repositories/repositories.dart';
import '../../../ui/helpers/helpers.dart';
import '../../app_navigation.dart';
import '../../app_routes.dart';

class HomeController extends GetxController with StateManagerControllerMixin {
  final CompaniesRepository _companiesRepository;

  HomeController({
    required CompaniesRepository companiesRepository,
  }) : _companiesRepository = companiesRepository;

  final _companies = RxList<CompanyModel>();
  List<CompanyModel> get companies => _companies;

  final _errorMessage = Rx<String?>(null);
  Rx<String?> get errorMessage => _errorMessage;

  @override
  void onReady() {
    super.onReady();
    _fetchCompanies();
  }

  void onNavigateToAssets(String companyId) {
    AppNavigation.push(
      route: AppRoutes.assets,
      args: {'companyId': companyId},
    );
  }

  Future<void> _fetchCompanies() async {
    try {
      setLoading();
      final result = await _companiesRepository.getCompanies();
      _companies.assignAll(result);
      setSuccess();
    } on CustomException catch (e) {
      _errorMessage.value = e.message;
      setError();
    }
  }
}
