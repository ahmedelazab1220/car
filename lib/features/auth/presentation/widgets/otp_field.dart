import 'package:car_help/core/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/utils/app_colors.dart';

class OtpField extends StatelessWidget {
  final void Function(String)? onCompleted;
  final TextEditingController? controller;
  const OtpField({super.key, this.onCompleted, this.controller});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: SizeConfig.screenWidth * 0.18,
      height: SizeConfig.screenWidth * 0.18,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.grey)),
    );
    return Pinput(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      controller: controller,
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: AppColors.primary),
        ),
      ),
      onCompleted: onCompleted,
    );
  }
}
