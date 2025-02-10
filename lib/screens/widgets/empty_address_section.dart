import 'package:flutter/material.dart';

class EmptyAddressSection extends StatelessWidget {
  const EmptyAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_off,
            size: 48,
          ),
          const SizedBox(height: 8),
          Text(
            'No addresses found',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
