import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "39".tr,
    middleText: "40".tr,
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("41".tr),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("42".tr),
      ),
    ],
  );
  return Future.value(true);
}
