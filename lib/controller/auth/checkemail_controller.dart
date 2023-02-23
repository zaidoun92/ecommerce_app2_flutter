import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  checkemail();
  goToVerifyCode();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;
  //
  @override
  goToVerifyCode() {
    Get.offNamed(AppRoute.verifyCodeSignUp);
  }

  @override
  checkemail() {}

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
