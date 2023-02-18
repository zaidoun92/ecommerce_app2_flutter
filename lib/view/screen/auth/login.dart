import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:ecommercecourse/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "3".tr,
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
            const LogoAuth(),
            const CustomTextTitleAuth(text: "Welcome Back"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
              text:
                  "Sign In With Your Email And Password OR Continue With Social Media",
            ),
            const SizedBox(height: 15),
            const CustomTextFormAuth(
              hintText: "Enter Your Email",
              labelText: "Email",
              iconData: Icons.email_outlined,
            ),
            const CustomTextFormAuth(
              hintText: "Enter Your Password",
              labelText: "Password",
              iconData: Icons.lock_outline,
            ),
            const Text(
              "Forget Password",
              textAlign: TextAlign.end,
            ),
            CustomButtonAuth(
              text: "Sign In",
              onPressed: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account"),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
