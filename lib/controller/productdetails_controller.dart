import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetatilsController extends GetxController {}

class ProductDetatilsControllerImp extends ProductDetatilsController {
  //
  CartController cartController = Get.put(CartController());
  //
  late ItemsModel itemsModel;

  intialData() {
    itemsModel = Get.arguments['itemsmodel'];
  }

  List subItems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'},
  ];

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
