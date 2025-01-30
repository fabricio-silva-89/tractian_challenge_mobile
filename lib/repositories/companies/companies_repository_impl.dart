import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';

import 'package:dio/dio.dart';

import '../../core/exceptions/custom_exception.dart';
import '../../core/rest_client/custom_rest_client.dart';
import '../../models/model.dart';
import 'companies.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  final CustomRestClient _client;

  CompaniesRepositoryImpl({required CustomRestClient client})
      : _client = client;

  @override
  Future<List<NodeModel>> getAssetsByCompany({
    required String companyId,
  }) async {
    try {
      final response = await _client.get('/companies/$companyId/assets');
      final nodes = Isolate.run<List<NodeModel>>(() {
        final data = jsonDecode(response.data) as List<dynamic>;
        return data
            .cast<Map<String, dynamic>>()
            .map(NodeModel.fromMap)
            .toList();
      });
      return nodes;
    } on DioException catch (e, s) {
      log('Erro ao buscar os ativos', error: e, stackTrace: s);
      throw CustomException(message: 'Erro ao buscar os ativos');
    } catch (e, s) {
      log('Erro ao buscar os ativos', error: e, stackTrace: s);
      throw CustomException(message: 'Erro ao buscar os ativos');
    }
  }

  @override
  Future<List<CompanyModel>> getCompanies() async {
    try {
      final response = await _client.get('/companies');
      final companies = Isolate.run<List<CompanyModel>>(() {
        final data = jsonDecode(response.data) as List<dynamic>;
        return data
            .cast<Map<String, dynamic>>()
            .map(CompanyModel.fromMap)
            .toList();
      });
      return companies;
    } on DioException catch (e, s) {
      log('Erro ao buscar as empresas', error: e, stackTrace: s);
      throw CustomException(message: 'Erro ao buscar as empresas');
    } catch (e, s) {
      log('Erro ao buscar as empresas', error: e, stackTrace: s);
      throw CustomException(message: 'Erro ao buscar as empresas');
    }
  }

  @override
  Future<List<NodeModel>> getLocationsByCompany({
    required String companyId,
  }) async {
    try {
      final response = await _client.get('/companies/$companyId/locations');
      final nodes = Isolate.run<List<NodeModel>>(() {
        final data = jsonDecode(response.data) as List<dynamic>;
        return data
            .cast<Map<String, dynamic>>()
            .map(NodeModel.fromMap)
            .toList();
      });
      return nodes;
    } on DioException catch (e, s) {
      log('Erro ao buscar as localizações', error: e, stackTrace: s);
      throw CustomException(message: 'Erro ao buscar as localizações');
    } catch (e, s) {
      log('Erro ao buscar as localizações', error: e, stackTrace: s);
      throw CustomException(message: 'Erro ao buscar as localizações');
    }
  }
}
