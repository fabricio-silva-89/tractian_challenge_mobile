import '../../../core/env/env.dart';
import '../../../repositories/repositories.dart';
import '../factories.dart';

CompaniesRepository makeCompanyRepository() {
  return CompaniesRepositoryImpl(
    client: makeCustomRestClient(Env.instance.get('base_url')),
  );
}
