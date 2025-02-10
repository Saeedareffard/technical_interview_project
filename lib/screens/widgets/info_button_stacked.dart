import 'package:flutter/material.dart';

class InfoButtonStacked extends StatelessWidget {
  const InfoButtonStacked({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Icon(
          Icons.info,
          color: Colors.blue[300],
        ),
      ],
    );
  }
}
