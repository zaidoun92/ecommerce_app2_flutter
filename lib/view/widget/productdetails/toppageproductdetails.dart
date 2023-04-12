import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class TopProductPageDetails extends GetView<ProductDetatilsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColor.secondColor,
            // borderRadius: BorderRadius.vertical(
            //   bottom: Radius.circular(20),
            // ),
          ),
        ),
        Positioned(
          top: 30.0,
          left: Get.width / 8,
          right: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageItems}/${controller.itemsModel.itemsImage!}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
