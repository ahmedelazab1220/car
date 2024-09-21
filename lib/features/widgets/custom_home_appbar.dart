import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  final String title;
  const CustomHomeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.textStyle14_700Black,
          ),
          const Spacer(),
          SvgPicture.asset(AppAssets.notifications)
        ],
      ),
    );
  }
}
