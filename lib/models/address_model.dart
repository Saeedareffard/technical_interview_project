class AddressModel {
  final String locationId;

  final String addressText;

  const AddressModel({
    required this.locationId,
    required this.addressText,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      locationId: json['locationId'],
      addressText: json['addressText'],
    );
  }
}
