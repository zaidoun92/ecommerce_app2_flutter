// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommercecourse/view/widget/cart/topcartcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/cart/appbarcart.dart';
import '../widget/cart/customitemscartlist.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => BottomNavgationBarCart(
          controllerCoupon: controller.controllerCoupon!,
          onApplyCoupon: () {},
          price: "${cartController.priceorders}",
          discount: "10%",
          totalPrice: "1500",
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const TopAppBarCart(title: "My Cart"),
              const SizedBox(height: 10),
              TopCartCart(
                  message:
                      "You Have ${cartController.totalCountItems} Items in Your Cart"),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                      cartController.data.length,
                      (index) => CustomItemsCartList(
                        imageName: "${cartController.data[index].itemsImage}",
                        name: "${cartController.data[index].itemsName}",
                        count: "${cartController.data[index].countitems}",
                        price:
                            "${cartController.data[index].totalitemsprice} \$",
                        onAdd: () async {
                          await cartController
                              .add(cartController.data[index].itemsId!);
                          cartController.refreshPage();
                        },
                        onRemove: () async {
                          await cartController
                              .dalete(cartController.data[index].itemsId!);
                          cartController.refreshPage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
