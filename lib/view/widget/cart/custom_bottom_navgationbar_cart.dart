import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'buttoncart.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalPrice;

  const BottomNavgationBarCart({
    super.key,
    required this.price,
    required this.shipping,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "price",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$price \$",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Shipping",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$shipping \$",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Total Price",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "$totalPrice \$",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "sans",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomButtonCart(textbutton: "Pleace Order", onPressed: () {}),
        ],
      ),
    );
  }
}
