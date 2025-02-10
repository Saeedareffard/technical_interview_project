import 'package:flutter/material.dart';

class AvailabilityChip extends StatelessWidget {
  const AvailabilityChip({super.key, required this.isAvailable});
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        !isAvailable
            ? 'No Fiber 1000 products available.'
            : 'Fiber 1000 Available.',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      avatar: Icon(
        !isAvailable ? Icons.cancel : Icons.check_box_rounded,
        color: !isAvailable ? Colors.red : Colors.green,
      ),
      backgroundColor: !isAvailable ? Colors.red[100] : Colors.green[100],
    );
  }
}
