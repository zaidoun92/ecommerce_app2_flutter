import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  ItemsData itemsData = ItemsData(Get.find());

  List categories = [];

  int? selectedCat;

  String? catid;

  List data = [];

  late StatusRequest statusRequest;

  String deliverytime = "";

  MyServices myServices = Get.find();

  @override
  void onInit() {
    deliverytime = myServices.sharedPreferences.getString("deliverytime")!;
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
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

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {
      "itemsmodel": itemsModel,
    });
  }
}
