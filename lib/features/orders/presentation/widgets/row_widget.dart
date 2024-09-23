import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String name;
  final String description;
  const RowWidget({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * 0.2,
            child: Text(
              name,
              style: AppStyles.textStyle12_700Grey,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.5,
            child: Text(
              description,
              style: AppStyles.textStyle14_500White
                  .copyWith(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
