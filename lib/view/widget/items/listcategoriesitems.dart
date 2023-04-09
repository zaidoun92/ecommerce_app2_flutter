import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CustomListCategoriesItems extends GetView<ItemsControllerImp> {
  const CustomListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(ItemsControllerImp());

    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categorisModel:
                CategorisModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategorisModel categorisModel;
  final int? i;
  const Categories({super.key, required this.categorisModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categorisModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 3,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    )
                  : null,
              child: Text(
                "${categorisModel.categoriesName}",
                style: const TextStyle(fontSize: 20, color: AppColor.grey2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
