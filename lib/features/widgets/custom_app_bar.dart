// import 'package:flutter/material.dart';
// import 'package:car_help/config/helper/locale_helper/app_local.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_size.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final VoidCallback? pressIcon;
//   final String? title;
//   final List<Widget>? actions;
//   final Widget? titleWidget;
//   final bool? isCenterTitle;

//   const CustomAppBar(
//       {super.key,
//       this.pressIcon,
//       this.title,
//       this.actions,
//       this.titleWidget,
//       this.isCenterTitle = false});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             BackArrowWidget(
//               callback: pressIcon ?? () => Navigator.pop(context),
//             ),
//             AppText(
//               align: TextAlign.start,
//               text: title ?? '',
//               color: AppColors.black,
//               textSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ],
//         ));
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
