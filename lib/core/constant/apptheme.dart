import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColor.primaryColor),
    titleTextStyle: const TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Cairo",
      fontSize: 25,
    ),
    backgroundColor: Colors.grey[50],
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.black,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: AppColor.black,
    ),
    bodyText1: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontSize: 14,
    ),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  appBarTheme: const AppBarTheme(color: AppColor.primaryColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.black,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: AppColor.black,
    ),
    bodyText1: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontSize: 14,
    ),
  ),
  primarySwatch: Colors.blue,
);
