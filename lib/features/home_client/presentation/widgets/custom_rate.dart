import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomRate extends StatelessWidget {
  final num rate;
  const CustomRate({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          // size: 28,
          color: AppColors.darkGrey,
        ),
        Text(
          rate.toString(),
          overflow: TextOverflow.ellipsis,
          style: AppStyles.textStyle16_800,
        ),
      ],
    );
  }
}
