import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ShowDialog {
  static Future<void> showMyDialog(
      {required BuildContext context,
      required final Widget widget,
      List<Widget>? bottons,
      String? title,
      String? subtitle,
      double borderRadius = 16,
      bool dismissible = true}) async {
    return showAdaptiveDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          actionsPadding: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          title: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget,
              if (title != null)
                const SizedBox(
                  height: 10,
                ),
              if (title != null)
                Text(
                  title,
                  style: AppStyles.textStyle18_900,
                ),
              if (subtitle != null)
                const SizedBox(
                  height: 10,
                ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: AppStyles.textStyle13_600,
                  textAlign: TextAlign.center,
                )
            ],
          )),
          actions: bottons,
        );
      },
    );
  }
}
