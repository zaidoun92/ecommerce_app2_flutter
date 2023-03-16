import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  late String verifycode;

  String? email;
  StatusRequest? statusRequest;
  //
  @override
  goToSuccessSignUp() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(
      email!,
      verifycode,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
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

  @override
  checkCode() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
