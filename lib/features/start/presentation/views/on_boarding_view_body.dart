import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/start/presentation/views/Custom_onboarding_slider.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnboardingSlider(
      height: SizeConfig.bodyHeight * 0.55,
    );
  }
}
