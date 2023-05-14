import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/add_controller.dart';

class AddressAdd extends GetView {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Address")),
      body: Container(
        child: GetBuilder<AddAddressController>(
          builder: (controllerpage) => HandlingDataView(
            statusRequest: controllerpage.statusRequest,
            widget: Column(
              children: [
                if (controllerpage.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          markers: controllerpage.markers.toSet(),
                          onTap: (latlang) {
                            controllerpage.addMarkers(latlang);
                          },
                          mapType: MapType.normal,
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerpage.completercontroller!
                                .complete(controllermap);
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          child: MaterialButton(
                            minWidth: 200,
                            onPressed: () {
                              controllerpage.goToPageAddDetailsAddress();
                            },
                            color: AppColor.primaryColor,
                            textColor: Colors.white,
                            child: const Text(
                              "Complete",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
