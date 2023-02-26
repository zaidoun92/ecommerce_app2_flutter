import 'package:get/get.dart';

import 'controller/auth/signup_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}
