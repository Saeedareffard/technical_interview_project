import 'package:dio/dio.dart';
import 'package:technical_question/models/qualification_info_model.dart';
import 'package:technical_question/repositories/base_location_product_qualification_repository.dart';
import 'package:technical_question/repositories/helpers/product_verifier_filter.dart';

class LocationProductQualificationRepositoryImpl
    extends BaseLocationProductQualificationRepository {
  final Dio _dio;

  LocationProductQualificationRepositoryImpl({required Dio dio}) : _dio = dio;
  @override
  Future<QualificationInfoModel> getProductsByLocationId(
      String locationId) async {
    try {
      final response = await _dio.get(
        BaseLocationProductQualificationRepository.apiUrl,
        queryParameters: {
          'locationId': locationId,
          'businessGroup': '2degrees',
          'salesChannel': 'OnlineSignup'
        },
      );
      return ProductVerifierFilter.verify(response.data);
    } on DioException {
      rethrow;
    }
  }
}
