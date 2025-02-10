import 'package:technical_question/models/products.dart';
import 'package:technical_question/models/qualification_info_model.dart';

class ProductVerifierFilter {
  static QualificationInfoModel verify(Map<String, dynamic> data) {
    final String locationId = data['locationId'];
    final String address = data['address']?['addressText'] ?? '';
    final String aerialImageUrl =
        data['propertySummary']['aerialImageUrl'] ?? '';
    final String boundaryImageUrl =
        data['propertySummary']['boundaryImageUrl'] ?? '';
    final List<Products> fiber1000EnabledProducts = filterProducts(data);
    return QualificationInfoModel(
      locationId: locationId,
      address: address,
      aerialImageUrl: aerialImageUrl,
      boundaryImageUrl: boundaryImageUrl,
      fiber1000EnabledProducts: fiber1000EnabledProducts,
    );
  }

  static List<Products> filterProducts(Map<String, dynamic> data) {
    final List<Products> validProducts = [];
    if (data['coreServices'] is List) {
      for (final service in data['coreServices']) {
        if (service['coreProducts'] is List) {
          for (final product in service['coreProducts']) {
            if (product['coreProductBroadbandCategory'] == 'UFB1000/500') {
              validProducts.add(Products.fromJson(product));
            }
          }
        }
      }
    }
    return validProducts;
  }
}
