import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetatilsController extends GetxController {}

class ProductDetatilsControllerImp extends ProductDetatilsController {
  late ItemsModel itemsModel;

  intialData() {
    itemsModel = Get.arguments['itemsmodel'];
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
