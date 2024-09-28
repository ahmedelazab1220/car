import 'dart:ui';

import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/show_dialog.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SettingsHelper {
  static void showCustomDialog({
    required BuildContext context,
    required String title,
    Function()? onPressd,
  }) {
    ShowDialog.showMyDialog(
      dismissible: false,
      context: context,
      widget: SvgPicture.asset(AppAssets.warning),
      title: title,
      bottons: [
        CustomButton(
          height: 44,
          radius: 8,
          titleColor: AppColors.black,
          borderColor: AppColors.grey,
          color: Colors.transparent,
          margin: const EdgeInsets.all(6),
          width: SizeConfig.screenWidth * .35,
          onPressed: () => GoRouter.of(context).pop(),
          title: S.of(context).cancel,
        ),
        CustomButton(
          height: 44,
          radius: 8,
          colors: const [Colors.transparent, Colors.transparent],
          margin: const EdgeInsets.all(6),
          width: SizeConfig.screenWidth * .35,
          onPressed: onPressd,
          title: S.of(context).ok,
        ),
      ],
    );
  }

  static Future<void> showBottomSheetDialog({
    required BuildContext context,
    required Widget widget,
  }) async {
    showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      builder: (context) => Material(
        child: Container(
            height: SizeConfig.bodyHeight * .55,
            width: double.infinity,
            margin: screenPadding(),
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: widget),
      ),
    );
  }
}
