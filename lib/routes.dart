import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/screen/auth/checkemail.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/login.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/success_signup.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommercecourse/view/screen/auth/verifycodesignup.dart';
import 'package:ecommercecourse/view/screen/onboarding.dart';
import 'package:flutter/cupertino.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // Auth
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgePassword: (context) => const ForgetPassword(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.verfiyCode: (context) => const VeryfiyCode(),
  AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
  AppRoute.successSignUp: (context) => const SuccessSignUp(),
  AppRoute.checkEmail: (context) => const CheckEmail(),
  AppRoute.verifyCodeSignUp: (context) => const VerifyCodeSignUp(),
  //OnBoarding
  AppRoute.onBoarding: (context) => const OnBoarding(),
};
