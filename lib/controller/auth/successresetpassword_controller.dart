import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  late TextEditingController email;
  //
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
