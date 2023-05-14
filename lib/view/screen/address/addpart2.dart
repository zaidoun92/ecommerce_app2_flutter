import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/address/addparttwo_controller.dart';

class AddressAddPartTwo extends GetView {
  const AddressAddPartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressPartTwoController controllerpage =
        Get.put(AddAddressPartTwoController());
    return Scaffold(
      appBar: AppBar(title: const Text("add details address")),
      body: GetBuilder<AddAddressPartTwoController>(
        builder: (controllerpage) => HandlingDataView(
          statusRequest: controllerpage.statusRequest,
          widget: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
