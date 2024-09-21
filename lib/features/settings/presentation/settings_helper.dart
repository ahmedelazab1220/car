import 'dart:ui';

import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/settings/presentation/widgets/cancelling_order_bottom_sheet_body.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SettingsHelper {
  static void showCustomDialog(
      {required BuildContext context,
      Function()? onPressd,
      required String title}) {
    showDialog(
      barrierColor: AppColors.white.withOpacity(0),
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                color: Colors.black
                    .withOpacity(0.2), // Optional: add slight darkness
              ),
            ),
            AlertDialog(
              // backgroundColor: const Color(0xffFFF2E7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              actionsAlignment: MainAxisAlignment.spaceAround,
              actionsPadding: const EdgeInsets.symmetric(vertical: 8),
              // icon: SvgPicture.asset(AppAssets.dialogeIcon),
              title: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      title,
                      style: AppStyles.textStyle16_800,
                    ),
                  ),
                ],
              ),
              titlePadding: const EdgeInsets.all(12),
              contentPadding: const EdgeInsets.all(6),
              actions: [
                TextButton(
                  onPressed: onPressd,
                  child: Text(S.of(context).ok),
                ),
                TextButton(
                  onPressed: () => GoRouter.of(context).pop(),
                  child: Text(S.of(context).cancel),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  static Future<void> showBottomSheetDialog({
    required BuildContext context,
    required Widget widget,
  }) async {
    showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      builder: (context) => Container(
          height: SizeConfig.bodyHeight * .55,
          width: double.infinity,
          margin: screenPadding(),
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: widget),
    );
  }
}
