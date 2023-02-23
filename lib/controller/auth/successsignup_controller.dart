import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  late TextEditingController email;
  //
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
