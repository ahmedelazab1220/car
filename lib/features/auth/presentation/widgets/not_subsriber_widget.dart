import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:car_help/core/utils/app_colors.dart';

import 'package:go_router/go_router.dart';

class NotSubscriberWidget extends StatelessWidget {
  const NotSubscriberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: S.of(context).notSubscribedWithUs,
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          textSize: 14,
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () => GoRouter.of(context).push(AppRouter.kRegisterView),
          child: AppText(
            text: S.of(context).createAccount,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            textSize: 14,
            textDecoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }
}
