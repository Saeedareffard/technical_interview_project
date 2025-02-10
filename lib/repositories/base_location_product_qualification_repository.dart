import 'package:technical_question/constants/api_constants.dart';
import 'package:technical_question/models/qualification_info_model.dart';

abstract class BaseLocationProductQualificationRepository {
  static const String apiUrl =
      '${ApiConstants.baseSalesUrl}qualification/qualify';
  Future<QualificationInfoModel> getProductsByLocationId(String locationId);
}
