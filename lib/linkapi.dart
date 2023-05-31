class AppLink {
  //
  static const String server = "https://zaidountest.online/ecommerce7";

  //

  // ===================== Images ========================//
  static const String imagestatic =
      "https://zaidountest.online/ecommerce7/upload";
  static const String imageCategories = "$imagestatic/categories";
  static const String imageItems = "$imagestatic/items";

  // ===================== Test ========================//
  static const String test = "$server/test.php";

  // ===================== Auth ========================//
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodeSignup = "$server/auth/verifycode.php";
  static const String resend = "$server/auth/resend.php";

  // ===================== ForgetPassword ========================//
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";

  // ===================== Home ========================//

  static const String homePage = "$server/home.php";

  // ===================== Items ========================//
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";

  // ===================== Items ========================//
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";

  // ===================== Items ========================//
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/remove.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  // ===================== Address ========================//
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  // ===================== Coupon ========================//
  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  // ===================== Checkout ========================//
  static const String checkout = "$server/orders/checkout.php";
}
