import 'package:ecommercecourse/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Settings"),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Profile"),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Favorite"),
        ),
      ],
    ),
  ];

  List titlebottomappbar = [
    "home",
    "Settings",
    "Profile",
    "Favorite",
  ];

  List iconsbuttonAppBar = [
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.favorite,
  ];

  //
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
