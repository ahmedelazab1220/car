import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DayWorkingHours extends StatelessWidget {
  final String dayName;
  final String startHour;
  final String endHour;
  const DayWorkingHours({
    super.key,
    required this.dayName,
    required this.startHour,
    required this.endHour,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          dayName,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.textStyle14_800Black,
        ),
        const Spacer(),
        Text(
          startHour,
          style: AppStyles.textStyle14_800Black,
        ),
        Icon(
          Icons.keyboard_double_arrow_left,
          color: AppColors.primary,
        ),
        Text(
          endHour,
          style: AppStyles.textStyle14_800Black,
        ),
      ],
    );
  }
}
