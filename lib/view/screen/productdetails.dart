import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/productdetails/priceandcount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/productdetails/subitemslist.dart';
import '../widget/productdetails/toppageproductdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetatilsControllerImp controller =
        Get.put(ProductDetatilsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: AppColor.secondColor,
          onPressed: () {},
          child: const Text(
            "Add To Cart",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const TopProductPageDetails(),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.itemsModel.itemsName}",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: AppColor.fourthColor),
                ),
                const SizedBox(height: 10),
                PriceAndCount(
                  onAdd: () {},
                  count: "2",
                  price: "20.0",
                  onRemove: () {},
                ),
                const SizedBox(height: 10),
                Text(
                  "${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 10),
                // Text(
                //   "Color",
                //   style: Theme.of(context)
                //       .textTheme
                //       .headline1!
                //       .copyWith(color: AppColor.fourthColor),
                // ),
                // const SizedBox(height: 10),
                // const SubItemsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
