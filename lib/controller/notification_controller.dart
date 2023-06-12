import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/orders/notification_data.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  List data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);
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
  void onInit() {
    getData();
    super.onInit();
  }
}
