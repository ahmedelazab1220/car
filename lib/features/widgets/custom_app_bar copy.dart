import 'package:car_help/features/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:car_help/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? pressIcon;
  final String? title;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final bool? isCenterTitle;

  const CustomAppBar(
      {super.key,
      this.pressIcon,
      this.title,
      this.actions,
      this.titleWidget,
      this.isCenterTitle = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
          children: [
          
            AppText(
              align: TextAlign.start,
              text: title ?? '',
              color: AppColors.black,
              textSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
