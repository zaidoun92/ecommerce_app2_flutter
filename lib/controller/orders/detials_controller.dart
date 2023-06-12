import 'dart:async';

import 'package:ecommercecourse/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;

  Completer<GoogleMapController>? completercontroller;
  CameraPosition? cameraPosition;
  List<Marker> markers = [];
  double? lat;
  double? lang;

  intialData() {
    cameraPosition = const CameraPosition(
      target: LatLng(35.22, 37.3),
      zoom: 12.4746,
    );
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    completercontroller = Completer<GoogleMapController>();
    intialData();
    super.onInit();
  }
}
