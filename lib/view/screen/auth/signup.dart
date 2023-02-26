import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/validinput.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => SignUpControllerImp());
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "17".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "10".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "24".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumbner: false,
                        valid: (val) {
                          return validInput(val!, 4, 20, "username");
                        },
                        hintText: "23".tr,
                        labelText: "20".tr,
                        iconData: Icons.person_outline,
                        myController: controller.username,
                      ),
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
                      CustomTextFormAuth(
                        isNumbner: true,
                        valid: (val) {
                          return validInput(val!, 7, 11, "phone");
                        },
                        hintText: "22".tr,
                        labelText: "21".tr,
                        iconData: Icons.phone_android_outlined,
                        myController: controller.phone,
                      ),
                      CustomTextFormAuth(
                        isNumbner: false,
                        valid: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        hintText: "13".tr,
                        labelText: "19".tr,
                        iconData: Icons.lock_outline,
                        myController: controller.password,
                      ),
                      CustomButtonAuth(
                        text: "17".tr,
                        onPressed: () {
                          controller.signUp();
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextSignUpOrSignIn(
                        text: "25".tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                        textTitle: "26".tr,
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
