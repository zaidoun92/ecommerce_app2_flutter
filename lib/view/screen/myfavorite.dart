import 'package:ecommercecourse/controller/myfavorite_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) => ListView(
            children: [
              CustomAppBar(
                titleappbar: "find Product",
                onPressedIcon: () {},
                onPressedSearch: () {},
                onPressedIconFavorite: () {
                  Get.toNamed(AppRoute.myfavorite);
                },
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Text(controller.data[index].itemsName!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
