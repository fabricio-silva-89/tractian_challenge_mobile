import 'base_model.dart';

class CompanyModel extends BaseModel {
  final String name;

  CompanyModel({
    required super.id,
    required this.name,
  });

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
}
