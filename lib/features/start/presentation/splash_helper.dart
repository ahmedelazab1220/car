import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/start/presentation/widgets/language_bottom_sheet_body.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SplashHelper {
  static Future<void> showBottomSheetDialog(
      {required BuildContext context}) async {
    showCupertinoModalBottomSheet(
      backgroundColor: Colors.white,
      transitionBackgroundColor: Colors.white,
      topRadius: const Radius.circular(30),
      context: context,
      builder: (context) => Container(
        height: SizeConfig.bodyHeight * .38,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: screenPadding(),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth * .2,
              height: 5,
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(20)),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              S.of(context).changeLanguage,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black),
            ),
            const LanguageBottomSheetBody(),
          ],
        ),
      ),
    );
  }
}
