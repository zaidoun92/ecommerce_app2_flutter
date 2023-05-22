import 'package:ecommercecourse/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import 'buttoncart.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price;
  final String discount;
  final String totalPrice;
  final TextEditingController controllerCoupon;
  final void Function()? onApplyCoupon;

  const BottomNavgationBarCart({
    super.key,
    required this.price,
    required this.discount,
    required this.totalPrice,
    required this.controllerCoupon,
    this.onApplyCoupon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: controllerCoupon,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      hintText: "Coupon Code",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  flex: 1,
                  child: CustomButtonCoupon(
                    textbutton: "apply",
                    onPressed: onApplyCoupon,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
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
                        "Discount",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        discount,
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
              ],
            ),
          ),
          const SizedBox(height: 10),
          CustomButtonCart(textbutton: "Pleace Order", onPressed: () {}),
        ],
      ),
    );
  }
}
