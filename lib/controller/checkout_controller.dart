import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/address_data.dart';
import 'package:ecommercecourse/data/datasource/remote/checkout_data.dart';
import 'package:ecommercecourse/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";
  late String couponid;
  late String priceorder;
  late String coupondiscount;

  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    // ignore: avoid_print
    print(
        "==============================zzzzzzzz $response zzzzzzzz==============================");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start Backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select order type");
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar("ERROR", "Please select Shipping Address");
    }
    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addresid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorder,
      "couponid": couponid,
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
    };

    var response = await checkoutData.checkout(data);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start Backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar("Success", "The order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments["couponid"];
    priceorder = Get.arguments["priceorder"];
    coupondiscount = Get.arguments["discountcoupon"].toString();
    getShippingAddress();
    super.onInit();
  }
}
