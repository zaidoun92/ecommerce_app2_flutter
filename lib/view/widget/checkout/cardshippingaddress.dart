import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CardShippingAddressCheckOut extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  const CardShippingAddressCheckOut({
    super.key,
    required this.title,
    required this.body,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColor.secondColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          title,
          style: isActive
              ? TextStyle(
                  color: isActive ? Colors.white : null,
                  fontWeight: FontWeight.bold,
                )
              : null,
        ),
        subtitle: Text(
          body,
          style: TextStyle(
            color: isActive ? Colors.white : null,
            fontWeight: isActive ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }
}
