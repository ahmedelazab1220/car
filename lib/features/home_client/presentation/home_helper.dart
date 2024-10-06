import 'package:car_help/core/utils/app_size.dart';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeHelper {
  static Future<void> showBottomSheetDialog({
    required BuildContext context,
    required Widget widget,
  }) async {
    showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      builder: (context) => Material(
        child: Container(
          height: SizeConfig.bodyHeight * .5,
          width: double.infinity,
          margin: screenPadding(),
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: widget,
        ),
      ),
    );
  }
}
