import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/imageassets.dart';
import 'package:ecommercecourse/core/functions/translatedatabase.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({
    super.key,
    required this.itemsModel,
    // required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageItems}/${itemsModel.itemsImage}",
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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Icon(
                          Icons.timer_sharp,
                          color: AppColor.grey,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${controller.deliverytime} Mints",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontFamily: "sans"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemsModel.itemsDiscount == "0"
                            ? "${itemsModel.itemsPrice}\$"
                            : "${itemsModel.itemsPriceDiscount}\$",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sans"),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemsModel.itemsId] ==
                                "1") {
                              controller.setFavorite(itemsModel.itemsId, "0");
                              controller.removeFavorite(itemsModel.itemsId!);
                            } else {
                              controller.setFavorite(itemsModel.itemsId, "1");
                              controller.addFavorite(itemsModel.itemsId!);
                            }
                          },
                          icon: Icon(
                            controller.isFavorite[itemsModel.itemsId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                top: 4,
                left: 4,
                child: Image.asset(
                  AppImageAsset.saleone,
                  width: 40,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
