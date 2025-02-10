import 'package:flutter/material.dart';
import 'package:technical_question/models/address_model.dart';

class AddressResultListItem extends StatelessWidget {
  const AddressResultListItem(
      {super.key, required this.address, required this.onTap});
  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(address.addressText),
      leading: const Icon(Icons.location_pin),
      onTap: onTap,
    );
  }
}
