import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/screen/notification.dart';
import 'package:ecommercecourse/view/screen/offers.dart';
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
    const OffersView(),
    const Settings(),
  ];

///////////////////////////////////////////////////
  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "notification", "icon": Icons.notifications_active_outlined},
    {"title": "Offers", "icon": Icons.offline_bolt_outlined},
    {"title": "Settings", "icon": Icons.settings},
  ];

  //
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
