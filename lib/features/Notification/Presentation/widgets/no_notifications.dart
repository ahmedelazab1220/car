import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NoNotifications extends StatelessWidget {
  final void Function()? onPressed;

  const NoNotifications({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Iconsax.notification1,
          size: 60,
        ),
        const SizedBox(
          height: 30,
          width: double.maxFinite,
        ),
        Text(
          S.of(context).noNotification,
          style: AppStyles.textStyle20_700,
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
