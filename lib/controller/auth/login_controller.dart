import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //
  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = true;

  showPassword() {
    isShowPassword = !isShowPassword;
    // isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  //
  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgePassword);
  }

  @override
  login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");
    } else {
      print("Not valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
