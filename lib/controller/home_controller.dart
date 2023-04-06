import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
}

class HomeControllerImp extends HomeController {
  HomeData homedata = HomeData(Get.find());
  // StatusRequest statusRequest = StatusRequest.none;
  late StatusRequest statusRequest;
  // List data = [];
  List categories = [];
  List items = [];
  //
  MyServices myServices = Get.find();

  String? username;
  String? id;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
