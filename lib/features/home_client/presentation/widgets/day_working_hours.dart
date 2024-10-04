import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DayWorkingHours extends StatelessWidget {
  final String dayName;
  final String startHour;
  final String endHour;
  final bool isAvilable;
  const DayWorkingHours({
    super.key,
    required this.dayName,
    required this.startHour,
    required this.endHour,
    required this.isAvilable,
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
        if (isAvilable)
          Text(
            startHour,
            style: AppStyles.textStyle14_800Black,
          ),
        if (isAvilable)
          Icon(
            Icons.keyboard_double_arrow_left,
            color: AppColors.primary,
          ),
        if (isAvilable)
          Text(
            endHour,
            style: AppStyles.textStyle14_800Black,
          ),
        if (!isAvilable)
          Text(
            endHour,
            style: AppStyles.textStyle14_800Black.copyWith(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
