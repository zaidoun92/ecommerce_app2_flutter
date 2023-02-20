import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/resetpassword_controller.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ListView(
          children: [
            const CustomTextTitleAuth(text: "New Password"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
              text: "Please Enter New Password",
            ),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              hintText: "Enter Your Password",
              labelText: "Password",
              iconData: Icons.lock_outline,
              myController: controller.password,
            ),
            CustomTextFormAuth(
              hintText: "Re Enter Your Password",
              labelText: "Password",
              iconData: Icons.lock_outline,
              myController: controller.repassword,
            ),
            CustomButtonAuth(
              text: "Save",
              onPressed: () {},
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
