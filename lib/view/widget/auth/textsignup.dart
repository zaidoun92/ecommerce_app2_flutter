import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String text;
  final String textTitle;
  final void Function() onTap;

  const CustomTextSignUpOrSignIn({
    super.key,
    required this.text,
    required this.onTap,
    required this.textTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textTitle),
        InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
