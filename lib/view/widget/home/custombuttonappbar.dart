import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  final IconData icondata;
  final bool? active;

  const CustomButtonAppBar({
    super.key,
    required this.textButton,
    required this.onPressed,
    required this.icondata,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: active == true ? AppColor.primaryColor : Colors.black,
          ),
          Text(
            textButton,
            style: TextStyle(
              color: active == true ? AppColor.primaryColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
