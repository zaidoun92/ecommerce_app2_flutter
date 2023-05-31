// ignore_for_file: avoid_unnecessary_containers

import 'package:ecommercecourse/controller/checkout_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imageassets.dart';
import 'package:ecommercecourse/view/widget/checkout/cardpaymentmethod.dart';
import 'package:ecommercecourse/view/widget/checkout/cardshippingaddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/checkout/carddeliverytype.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          color: AppColor.secondColor,
          textColor: Colors.white,
          onPressed: () {
            controller.checkout();
          },
          child: const Text(
            "Checkout",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const Text(
                  "Choose Payment Method",
                  style: TextStyle(
                    color: AppColor.secondColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("0"); // 0 = cash
                  },
                  child: CardPaymentMethodCheckout(
                    title: "Cash On Delivery",
                    isActive: controller.paymentMethod == "0" ? true : false,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("1"); // 1 = card
                  },
                  child: CardPaymentMethodCheckout(
                    title: "Payment Cards",
                    isActive: controller.paymentMethod == "1" ? true : false,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Choose Delivery Type",
                  style: TextStyle(
                    color: AppColor.secondColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("0"); // 0 = Delivry
                      },
                      child: CardDeliveryTypeCheckOut(
                          title: "Delivery",
                          imagename: AppImageAsset.deliveryImage2,
                          isActive:
                              controller.deliveryType == "0" ? true : false),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("1"); // 1 = revceve
                      },
                      child: CardDeliveryTypeCheckOut(
                          title: "Drive Thru",
                          imagename: AppImageAsset.drivethruImage,
                          isActive:
                              controller.deliveryType == "1" ? true : false),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (controller.deliveryType == "0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shipping Addres",
                        style: TextStyle(
                          color: AppColor.secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(
                        controller.dataaddress.length,
                        (index) => InkWell(
                          onTap: () {
                            controller.chooseShippingAddress(
                                controller.dataaddress[index].addressId!);
                          },
                          child: CardShippingAddressCheckOut(
                            title: controller.dataaddress[index].addressName!,
                            body:
                                "${controller.dataaddress[index].addressCity}/${controller.dataaddress[index].addressStreet}",
                            isActive: controller.addressid ==
                                    controller.dataaddress[index].addressId
                                ? true
                                : false,
                          ),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
