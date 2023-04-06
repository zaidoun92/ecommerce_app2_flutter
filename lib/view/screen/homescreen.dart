import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    //
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              Row(
                children: [
                  CustomButtonAppBar(
                    textButton: "Home",
                    icondata: Icons.home,
                    onPressed: () {
                      controller.changePage(0);
                    },
                    active: controller.currentpage == 0 ? true : false,
                  ),
                  CustomButtonAppBar(
                    textButton: "Settings",
                    icondata: Icons.home,
                    onPressed: () {
                      controller.changePage(1);
                    },
                    active: controller.currentpage == 1 ? true : false,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  CustomButtonAppBar(
                    textButton: "Profile",
                    icondata: Icons.home,
                    onPressed: () {
                      controller.changePage(2);
                    },
                    active: controller.currentpage == 2 ? true : false,
                  ),
                  CustomButtonAppBar(
                    textButton: "Favorite",
                    icondata: Icons.home,
                    onPressed: () {
                      controller.changePage(3);
                    },
                    active: controller.currentpage == 3 ? true : false,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: controller.listPage.elementAt(controller.currentpage),
      ),
    );
  }
}
