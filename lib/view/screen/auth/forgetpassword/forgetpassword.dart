import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword_controller.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Forget Password",
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
            const CustomTextTitleAuth(text: "Check Email"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
              text:
                  "please Enter Your Email Address To Recive A Verification code",
            ),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              hintText: "Enter Your Email",
              labelText: "Email",
              iconData: Icons.email_outlined,
              myController: controller.email,
            ),
            CustomButtonAuth(
              text: "Check",
              onPressed: () {
                controller.goToVerfiyCode();
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}