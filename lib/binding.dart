import 'package:get/get.dart';

import 'controller/forgetpassword/forgetpassword_controller.dart';
import 'controller/forgetpassword/resetpassword_controller.dart';
import 'controller/auth/successresetpassword_controller.dart';
import 'controller/forgetpassword/verifycode_controller.dart';
import 'controller/auth/verifycodesignup_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    // Get.lazyPut(() => LoginControllerImp(), fenix: true);
    Get.lazyPut(() => VerifyCodeSignUpControllerImp(), fenix: true);
    Get.lazyPut(() => VerifyCodeControllerImp(), fenix: true);
    Get.lazyPut(() => ResetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => SuccessResetPasswordControllerImp(), fenix: true);
  }
}
