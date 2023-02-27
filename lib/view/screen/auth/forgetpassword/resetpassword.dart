import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/resetpassword_controller.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "ResetPassword",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body:
          // GetBuilder<ResetPasswordControllerImp>(
          //   builder: (controller) =>
          Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: "35".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(text: "35".tr),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              isNumbner: false,
              valid: (val) {},
              hintText: "13".tr,
              labelText: "19".tr,
              iconData: Icons.lock_outline,
              myController: controller.password,
            ),
            CustomTextFormAuth(
              isNumbner: false,
              valid: (val) {},
              hintText: "Re ${"13".tr}",
              labelText: "19".tr,
              iconData: Icons.lock_outline,
              myController: controller.repassword,
            ),
            CustomButtonAuth(
              text: "33".tr,
              onPressed: () {
                controller.goToSuccessResetPassword();
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      // ),
    );
  }
}
