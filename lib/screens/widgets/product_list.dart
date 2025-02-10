import 'package:flutter/material.dart';
import 'package:technical_question/models/qualification_info_model.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.qualification});
  final QualificationInfoModel qualification;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: qualification.fiber1000EnabledProducts.length,
      itemBuilder: (context, index) {
        final product = qualification.fiber1000EnabledProducts[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            title: Text(
              product.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                product.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            trailing: Chip(
              labelStyle: Theme.of(context).textTheme.bodySmall,
              label: Text(
                product.category,
                style: TextStyle(
                  fontStyle: Theme.of(context).textTheme.bodySmall!.fontStyle,
                ),
              ),
              backgroundColor: Colors.blue[100],
            ),
          ),
        );
      },
    );
  }
}
