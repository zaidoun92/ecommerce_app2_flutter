import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/screen/notification.dart';
import 'package:ecommercecourse/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const NotificationView(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Profile"),
        ),
      ],
    ),
    const Settings(),
  ];

///////////////////////////////////////////////////
  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "n", "icon": Icons.notifications_active_outlined},
    {"title": "Profile", "icon": Icons.person_pin_sharp},
    {"title": "Settings", "icon": Icons.settings},
  ];

  //
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
