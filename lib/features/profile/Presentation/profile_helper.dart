import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/config/helper/helper.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/show_dialog.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileHelper {
  static void showCustomUnauthorizedDialog({
    required BuildContext context,
    Function()? onPressd,
  }) {
    ShowDialog.showMyDialog(
      dismissible: false,
      context: context,
      widget: const SizedBox(),
      title: S.of(context).sessionExpired,
      subtitle: S.of(context).sessionExpiredMsg,
      bottons: [
        CustomButton(
          margin: const EdgeInsets.all(6),
          width: SizeConfig.screenWidth * .35,
          onPressed: () {
            CacheHelper().deleteCache();
            refreshMessagesToken();
            GoRouter.of(context).pushReplacement(AppRouter.kStartView);
          },
          title: S.of(context).ok,
        ),
      ],
    );
  }
}
