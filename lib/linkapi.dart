class AppLink {
  //
  static const String server = "https://zaidountest.online/ecommerce7";
  //
  static const String test = "$server/test.php";

  // ===================== Auth ========================//
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodeSignup = "$server/auth/verifycode.php";

  // ===================== ForgetPassword ========================//
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";
}
