import 'package:ecommercecourse/core/constant/color.dart';
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
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Sign Up",
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
            const CustomTextTitleAuth(text: "Welcome Back"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
              text:
                  "Sign Up With Your Email And Password OR Continue With Social Media",
            ),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              hintText: "Enter Your Username",
              labelText: "Username",
              iconData: Icons.person_outline,
              myController: controller.username,
            ),
            CustomTextFormAuth(
              hintText: "Enter Your Email",
              labelText: "Email",
              iconData: Icons.email_outlined,
              myController: controller.email,
            ),
            CustomTextFormAuth(
              hintText: "Enter Your Phone",
              labelText: "Phone",
              iconData: Icons.phone_android_outlined,
              myController: controller.phone,
            ),
            CustomTextFormAuth(
              hintText: "Enter Your Password",
              labelText: "Password",
              iconData: Icons.lock_outline,
              myController: controller.password,
            ),
            CustomButtonAuth(
              text: "Sign Up",
              onPressed: () {
                controller.signUp();
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextSignUpOrSignIn(
              text: " Sign In",
              onTap: () {
                controller.goToSignIn();
              },
              textTitle: "have an account ? ",
            ),
          ],
        ),
      ),
    );
  }
}
