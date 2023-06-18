import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
