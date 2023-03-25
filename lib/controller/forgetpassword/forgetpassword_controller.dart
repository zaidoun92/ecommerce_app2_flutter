import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //
  late TextEditingController email;
  //

  @override
  checkemail() async {
    try {
      if (formstate.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await checkEmailData.postData(
          email.text,
        );
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoute.verfiyCode, arguments: {
              "email": email.text,
            });
          } else {
            Get.defaultDialog(
              title: "WARNING",
              middleText: "Email Not Found",
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
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
