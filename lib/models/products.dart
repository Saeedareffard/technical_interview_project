class Products {
  final String name;
  final String description;
  final String category;

  Products(
      {required this.name, required this.description, required this.category});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      name: json['coreProductKey'],
      description: json['coreProductDescription'],
      category: json['coreProductBroadbandCategory'],
    );
  }
}
