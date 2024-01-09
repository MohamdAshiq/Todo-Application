import 'package:flutter/material.dart';

class DetailTextWidget extends StatelessWidget {
  const DetailTextWidget({
    super.key,
    required this.label,
    required this.itemName,
  });

  final String label;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Text(
        "$label  :  $itemName",
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
