import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControlerImp extends OnBoardingController {
  //
  late PageController pageController;
  //
  int currentPage = 0;
  //
  ///////////////////////////////////////////////////////////
  // how to check if the user first time visit the app or not
  MyServices myServices = Get.find();
  ///////////////////////////////////////////////////////////
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      ///////////////////////////////////////////////////////////
      // how to check if the user first time visit the app or not
      myServices.sharedPreferences.setString("onboarding", "1");
      ///////////////////////////////////////////////////////////
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
