import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/address_data.dart';
import 'package:ecommercecourse/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List<AddressModel> data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    print("============ $response ");

    if (StatusRequest.success == statusRequest) {
      // Start Backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
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
