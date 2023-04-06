import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widget/home/customappbar.dart';
import 'package:ecommercecourse/view/widget/home/customcarthome.dart';
import 'package:ecommercecourse/view/widget/home/customlistcategorieshome.dart';
import 'package:ecommercecourse/view/widget/home/customlistitemshome.dart';
import 'package:ecommercecourse/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CustomAppBar(
                  titleappbar: "find Product",
                  onPressedIcon: () {},
                  onPressedSearch: () {}),
              const CustomCartHome(
                  title: "A Summer Surprise", body: "Cashback 20%"),
              const CustomTitleHome(title: "Categories"),
              const CustomListCategoriesHome(),
              const CustomTitleHome(title: "Product for you"),
              const CustomListItemsHome(),
              const CustomTitleHome(title: "Offer"),
              const CustomListItemsHome(),
            ],
          ),
        ),
      ),
    );
  }
}
