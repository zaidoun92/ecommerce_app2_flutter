import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class CustomListCategoriesHome extends GetView<HomeControllerImp> {
  const CustomListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            categorisModel:
                CategorisModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategorisModel categorisModel;
  const Categories({super.key, required this.categorisModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          width: 70,
          child: SvgPicture.network(
            "${AppLink.imageCategories}/${categorisModel.categoriesImage}",
            color: AppColor.secondColor,
          ),
        ),
        Text(
          "${categorisModel.categoriesName}",
          style: const TextStyle(fontSize: 13, color: AppColor.black),
        )
      ],
    );
  }
}
