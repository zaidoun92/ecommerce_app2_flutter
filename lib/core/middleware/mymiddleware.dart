import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

////////////////////////////////////////////////////////////////
// we use middleware to check if the user first time visit the app
//or not so if it is the first time we make him see the onBoarding
// pages if not we direct him to login page
////////////////////////////////////////////////////////////////
class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
  }
}
