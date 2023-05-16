import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? lang;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    lang = Get.arguments['lang'];

    print("Lat :::::::: $lat ");
    print("lang :::::::: $lang ");
  }

  addDetails() async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "46".tr,
          messageText: Text("47".tr),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
