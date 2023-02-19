import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  checkemail();
  goToVerfiyCode();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController email;
  //
  @override
  goToVerfiyCode() {
    Get.offNamed(AppRoute.verfiyCode);
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
