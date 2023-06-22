import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/home_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  // List data = [];
  List categories = [];
  List items = [];
  List settingsdata = [];
  //

  String? username;
  String? id;
  String? lang;

  //
  String titleHomeCard = "";
  String bodyHomeCard = "";
  String deliveryTime = "";

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
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
      //
      if (response['status'] == "success") {
        //
        categories.addAll(response['categories']['data']);

        items.addAll(response['items']['data']);

        settingsdata.addAll(response['settings']['data']);

        titleHomeCard = settingsdata[0]['settings_titlehome'];

        bodyHomeCard = settingsdata[0]['settings_bodyhome'];

        deliveryTime = settingsdata[0]['settings_deliverytime'];

        myServices.sharedPreferences.setString("deliverytime", deliveryTime);
        //
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid,
    });
  }
}

class SearchMixController extends GetxController {
  //
  HomeData homedata = HomeData(Get.find());
  List<ItemsModel> listdata = [];
  late StatusRequest statusRequest;
  TextEditingController? search;
  bool isSearch = false;
  //

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {
      "itemsmodel": itemsModel,
    });
  }
}
