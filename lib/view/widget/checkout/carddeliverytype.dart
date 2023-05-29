import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CardDeliveryTypeCheckOut extends StatelessWidget {
  final String title;
  final String imagename;
  final bool isActive;
  const CardDeliveryTypeCheckOut({
    super.key,
    required this.title,
    required this.imagename,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: isActive ? AppColor.secondColor : null,
        border: Border.all(color: AppColor.secondColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            width: 60,
            color: isActive ? Colors.white : null,
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : AppColor.secondColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
