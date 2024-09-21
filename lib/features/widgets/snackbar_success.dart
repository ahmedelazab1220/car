import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

void snackbarSuccess(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      backgroundColor: Colors.green,
      content: Text(
        message,
        style: AppStyles.textStyle14_800White,
      ),
    ),
  );
}
