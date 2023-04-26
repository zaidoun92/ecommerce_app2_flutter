import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/myfavorite_controller.dart';
import 'package:ecommercecourse/core/functions/translatedatabase.dart';
import 'package:ecommercecourse/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CustomFavoriteListItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  // final bool active;
  const CustomFavoriteListItems({
    super.key,
    required this.itemsModel,
    // required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rating 3.5",
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 20,
                    child: Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => const Icon(Icons.star, size: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsModel.itemsPrice} \$",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans"),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteFromFavorite(itemsModel.favoriteId!);
                    },
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
