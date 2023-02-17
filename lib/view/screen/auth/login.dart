import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          children: const [
            SizedBox(height: 20),
            CustomTextTitleAuth(text: "Welcome Back"),
            SizedBox(height: 10),
            CustomTextBodyAuth(
                text:
                    "Sign In With Your Email And Password OR Continue With Social Media"),
            SizedBox(height: 65),
            CustomTextFormAuth(
              hintText: "Enter Your Email",
              labelText: "Email",
              iconData: Icons.email_outlined,
            ),
            CustomTextFormAuth(
              hintText: "Enter Your Password",
              labelText: "Password",
              iconData: Icons.lock_outline,
            ),
          ],
        ),
      ),
    );
  }
}
