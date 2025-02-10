import 'package:technical_question/models/address_model.dart';
import 'package:technical_question/repositories/base_address_search_repo.dart';
import 'package:dio/dio.dart';

class AddressSearchRepositoryImpl extends BaseAddressSearchRepo {
  AddressSearchRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<AddressModel>> searchAddress(String address) async {
    if (address.isEmpty) return [];
    final response = await _dio.get(
      BaseAddressSearchRepo.apiUrl,
      queryParameters: {'address': address},
    );
    return (response.data['addresses'] as List)
        .map((e) => AddressModel.fromJson(e))
        .toList();
  }
}
