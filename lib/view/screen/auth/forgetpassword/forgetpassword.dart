import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "14".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  CustomTextTitleAuth(text: "27".tr),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(
                    text: "29".tr,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormAuth(
                    isNumbner: false,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    hintText: "12".tr,
                    labelText: "18".tr,
                    iconData: Icons.email_outlined,
                    myController: controller.email,
                  ),
                  CustomButtonAuth(
                    text: "30".tr,
                    onPressed: () {
                      controller.checkemail();
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
