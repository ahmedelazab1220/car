import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginBothWidget extends StatelessWidget {
  const LoginBothWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            CustomButton(
                height: 40,
                width: 160,
                onPressed: () => GoRouter.of(context).push(
                      AppRouter.kOnBoardingView,
                    ),
                title: S.of(context).login),
          ],
        ),
      ),
    );
  }
}
