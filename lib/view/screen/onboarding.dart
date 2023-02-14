import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/onboarding/custombutton.dart';
import 'package:ecommercecourse/view/widget/onboarding/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    //
    Get.put(OnBoardingControlerImp());
    //
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SafeArea(
          child: Column(
        children: [
          const Expanded(
            flex: 4,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: const [
                CustomDotControllerOnBoarding(),
                Spacer(flex: 2),
                CustomButtonOnBoarding(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
