import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class DailyWorkingHoursWidget extends StatelessWidget {
  const DailyWorkingHoursWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List days = [
      S.of(context).saturday,
      S.of(context).sunday,
      S.of(context).monday,
      S.of(context).tuesday,
      S.of(context).wednesday,
      S.of(context).thursday,
      S.of(context).friday,
    ];
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) {
          return DayWorkingHours(
            dayName: days[index],
            startHour: '9:00 ص',
            endHour: '11:00 م',
          );
        });
  }
}

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
