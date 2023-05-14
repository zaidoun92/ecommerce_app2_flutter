import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:get/get.dart';

class AddAddressPartTwoController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  String? lat;
  String? lang;

  intialData() {
    lat = Get.arguments['lat'];
    lang = Get.arguments['lang'];
    print("Lat :::::::: $lat ");
    print("lang :::::::: $lang ");
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
