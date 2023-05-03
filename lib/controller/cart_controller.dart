import 'package:ecommercecourse/data/datasource/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  /////////////////////////////////////////////////////////
  /// ADD Cart Function
  ////////////////////////////////////////////////////////
  add(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "46".tr,
          messageText: Text("49".tr),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  /////////////////////////////////////////////////////////
  /// Remove Cart Function
  ////////////////////////////////////////////////////////
  dalete(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "46".tr,
          messageText: Text("50".tr),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
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

  /////////////////////////////////////////////////////////
  /// View Cart Function
  ////////////////////////////////////////////////////////
  view() {}
}
