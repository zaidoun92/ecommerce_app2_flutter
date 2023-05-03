import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetatilsController extends GetxController {}

class ProductDetatilsControllerImp extends ProductDetatilsController {
  //
  CartController cartController = Get.put(CartController());
  //
  late ItemsModel itemsModel;

  late StatusRequest statusRequest;

  int countItems = 0;

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countItems = await cartController.getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  List subItems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'},
  ];

  add() {
    cartController.add(itemsModel.itemsId!);
    countItems++;
    update();
  }

  remove() {
    if (countItems > 0) {
      cartController.dalete(itemsModel.itemsId!);
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
