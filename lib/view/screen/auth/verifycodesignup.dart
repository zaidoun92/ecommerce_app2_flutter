import 'package:ecommercecourse/controller/auth/verifycodesignup_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../widget/auth/customtexttitleauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller =
        Get.put(VerifyCodeSignUpControllerImp());
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Verification Code",
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
            const CustomTextTitleAuth(text: "Check Code"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
              text: "Please Enter the Digit Code Sent To Zaidoun@gmail.com",
            ),
            const SizedBox(height: 15),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.goToSuccessSignUp();
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
