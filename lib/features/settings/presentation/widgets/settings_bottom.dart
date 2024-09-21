import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsButtom extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String? subTitle;
  final String icon;
  const SettingsButtom({
    super.key,
    this.onTap,
    required this.title,
    this.subTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.textStyle14_700Black),
                if (subTitle != null)
                  Text(subTitle!, style: AppStyles.textStyle12_700Grey),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
