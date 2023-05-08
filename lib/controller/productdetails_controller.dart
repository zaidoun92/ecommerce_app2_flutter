import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';
import '../data/model/cartmodel.dart';

abstract class ProductDetatilsController extends GetxController {}

class ProductDetatilsControllerImp extends ProductDetatilsController {
  //
  // CartController cartController = Get.put(CartController());
  //
  late ItemsModel itemsModel;

  late StatusRequest statusRequest;

  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  List<CartModel> data = [];

  int countItems = 0;

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countItems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  List subItems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'},
  ];

  /////////////////////////////////////////////////////////
  /// ADD Cart Function
  ////////////////////////////////////////////////////////
  addItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Get.rawSnackbar(
        //   title: "46".tr,
        //   messageText: Text("49".tr),
        // );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  /////////////////////////////////////////////////////////
  /// Remove Cart Function
  ////////////////////////////////////////////////////////
  daleteItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Get.rawSnackbar(
        //   title: "46".tr,
        //   messageText: Text("50".tr),
        // );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  /////////////////////////////////////////////////////////
  /// Cart Get Count Function
  ////////////////////////////////////////////////////////

  getCountItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        // print("==================================");
        // print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  add() {
    addItems(itemsModel.itemsId!);
    countItems++;
    update();
  }

  remove() {
    if (countItems > 0) {
      daleteItems(itemsModel.itemsId!);
      countItems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
