import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  //
  SignupData signupData = SignupData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  signUp() async {
    try {
      if (formstate.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        var response = await signupData.postData(
          username.text,
          password.text,
          email.text,
          phone.text,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            // data.addAll(response['data']);
            //
            Get.offNamed(AppRoute.verifyCodeSignUp);
          } else {
            Get.defaultDialog(
              title: "WARNING",
              middleText: "Phone Number Or Email Already Exists",
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
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
