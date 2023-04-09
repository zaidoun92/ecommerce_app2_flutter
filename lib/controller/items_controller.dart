import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
}

class ItemsControllerImp extends ItemsController {
  ItemsData itemsData = ItemsData(Get.find());
  List categories = [];
  int? selectedCat;
  String? catid;
  List data = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
