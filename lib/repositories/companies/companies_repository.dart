import '../../models/model.dart';

abstract interface class CompaniesRepository {
  Future<List<CompanyModel>> getCompanies();
  Future<List<NodeModel>> getLocationsByCompany({required String companyId});
  Future<List<NodeModel>> getAssetsByCompany({required String companyId});
}
