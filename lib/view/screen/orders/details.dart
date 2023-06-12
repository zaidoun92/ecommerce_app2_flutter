import 'package:ecommercecourse/controller/orders/detials_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Table(
                      children: const [
                        TableRow(
                          children: [
                            Text(
                              "Item",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "QTY",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Price",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("Macbook M1", textAlign: TextAlign.center),
                            Text("2", textAlign: TextAlign.center),
                            Text("1200", textAlign: TextAlign.center),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("S22 Ultra", textAlign: TextAlign.center),
                            Text("1", textAlign: TextAlign.center),
                            Text("1100", textAlign: TextAlign.center),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        "Price : 2400\$",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                child: const ListTile(
                  title: Text(
                    "Shipping Address",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Tikret Street one"),
                ),
              ),
            ),
            Card(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 300,
                width: double.infinity,
                child: GoogleMap(
                  markers: controller.markers.toSet(),
                  mapType: MapType.normal,
                  initialCameraPosition: controller.cameraPosition!,
                  onMapCreated: (GoogleMapController controllermap) {
                    controller.completercontroller!.complete(controllermap);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
