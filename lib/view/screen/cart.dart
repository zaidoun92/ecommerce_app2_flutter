// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/cart/buttoncart.dart';
import 'package:ecommercecourse/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommercecourse/view/widget/cart/topcartcart.dart';
import 'package:flutter/material.dart';
import '../widget/cart/appbarcart.dart';
import '../widget/cart/customitemscartlist.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavgationBarCart(
          price: "1200", shipping: "300", totalPrice: "1500"),
      body: ListView(
        children: [
          const TopAppBarCart(title: "My Cart"),
          const SizedBox(height: 10),
          const TopCartCart(message: "You Have 2 Items in Your Cart"),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                CustomItemsCartList(
                  name: "MackBook M2",
                  count: "2",
                  price: "1100 \$",
                ),
                CustomItemsCartList(
                  name: "MackBook M1",
                  count: "1",
                  price: "1000 \$",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
