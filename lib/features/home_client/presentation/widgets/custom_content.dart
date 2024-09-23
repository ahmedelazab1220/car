import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomContent extends StatelessWidget {
  const CustomContent({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.scendary,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textStyle10_800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
