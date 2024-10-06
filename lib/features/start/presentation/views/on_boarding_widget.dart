import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatelessWidget {
  final String title;
  const OnBoardingWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.9,
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle18_600,
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
