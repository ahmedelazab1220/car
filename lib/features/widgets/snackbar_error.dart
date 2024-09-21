import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

void snackbarError(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.down,
      backgroundColor: Colors.red,
      content: Text(
        errorMessage,
        style: AppStyles.textStyle14_800White,
      ),
    ),
  );
}
