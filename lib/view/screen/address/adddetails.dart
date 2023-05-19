import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/address/adddetails_controller.dart';
import '../../../core/shared/custombutton.dart';

class AddressAddDetails extends GetView {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(title: const Text("add details address")),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<AddAddressDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CustomTextFormAuth(
                  hintText: "city",
                  labelText: "city",
                  iconData: Icons.location_city,
                  myController: controller.city!,
                  valid: (val) {},
                  isNumbner: false,
                ),
                CustomTextFormAuth(
                  hintText: "street",
                  labelText: "street",
                  iconData: Icons.streetview,
                  myController: controller.street!,
                  valid: (val) {},
                  isNumbner: false,
                ),
                CustomTextFormAuth(
                  hintText: "name",
                  labelText: "name",
                  iconData: Icons.near_me,
                  myController: controller.name!,
                  valid: (val) {},
                  isNumbner: false,
                ),
                CustomButton(
                  text: "Add",
                  onPressed: () {
                    controller.addAddress();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
