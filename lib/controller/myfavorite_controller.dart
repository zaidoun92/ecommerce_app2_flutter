import 'package:ecommercecourse/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommercecourse/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  /////////////////////////////////////////////////////////
  /// remove Favorie Function
  ////////////////////////////////////////////////////////

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  /////////////////////////////////////////////////////////
  /// Delete Data From Favorite Table
  ////////////////////////////////////////////////////////

  deleteFromFavorite(String favoriteid) {
    // var response = favoriteData.deleteData(favoriteid);

    data.removeWhere((element) => element.favoriteId == favoriteid);

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
