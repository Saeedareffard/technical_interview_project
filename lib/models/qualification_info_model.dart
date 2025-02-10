import 'package:technical_question/models/products.dart';

class QualificationInfoModel {
  final String locationId;
  final String address;
  final String aerialImageUrl;
  final String boundaryImageUrl;
  final List<Products> fiber1000EnabledProducts;

  QualificationInfoModel({
    required this.locationId,
    required this.address,
    required this.aerialImageUrl,
    required this.boundaryImageUrl,
    required this.fiber1000EnabledProducts,
  });
}
