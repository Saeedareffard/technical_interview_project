import 'package:technical_question/constants/api_constants.dart';
import 'package:technical_question/models/address_model.dart';

abstract class BaseAddressSearchRepo {
  static const String apiUrl =
      '${ApiConstants.baseSalesUrl}qualification/addresses/search';
  Future<List<AddressModel>> searchAddress(String address);
}
