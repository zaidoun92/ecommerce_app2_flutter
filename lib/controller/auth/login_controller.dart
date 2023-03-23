import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

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

  StatusRequest? statusRequest;
  LoginData loginData = LoginData(Get.find());

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
  login() async {
    try {
      if (formstate.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await loginData.postData(
          password.text,
          email.text,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoute.homePage);
          } else {
            Get.defaultDialog(
              title: "WARNING",
              middleText: "Email Or Password Not Correct",
            );
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      }
    } catch (e) {
      // ignore: avoid_print
      print("ERROR $e");
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
