import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/screen/auth/forgetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/login.dart';
import 'package:ecommercecourse/view/screen/auth/resetpassword.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/verifycode.dart';
import 'package:ecommercecourse/view/screen/onboarding.dart';
import 'package:flutter/cupertino.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // Auth
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgePassword: (context) => const ForgetPassword(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.verfiyCode: (context) => const VeryfiyCode(),
  //OnBoarding
  AppRoute.onBoarding: (context) => const OnBoarding(),
};
