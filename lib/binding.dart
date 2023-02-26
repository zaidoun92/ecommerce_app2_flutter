import 'package:ecommercecourse/controller/auth/login_controller.dart';
import 'package:get/get.dart';

import 'controller/auth/forgetpassword_controller.dart';
import 'controller/auth/resetpassword_controller.dart';
import 'controller/auth/signup_controller.dart';
import 'controller/auth/successresetpassword_controller.dart';
import 'controller/auth/verifycode_controller.dart';
import 'controller/auth/verifycodesignup_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => LoginControllerImp(), fenix: true);
    Get.lazyPut(() => VerifyCodeSignUpControllerImp(), fenix: true);
    Get.lazyPut(() => VerifyCodeControllerImp(), fenix: true);
    Get.lazyPut(() => ResetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => SuccessResetPasswordControllerImp(), fenix: true);
  }
}