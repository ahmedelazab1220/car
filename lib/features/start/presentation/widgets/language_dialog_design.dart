// import 'package:car_help/config/helper/locale_helper/app_localizations_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:car_help/config/helper/locale_helper/app_local.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:car_help/widgets/app_text.dart';

// class LanguageDialogDesign extends StatelessWidget {
//   const LanguageDialogDesign({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 240,
//         margin: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
//         child:  Column(
//           children: [
//             Padding(
//               padding: screenPadding(padding: SizeConfig.screenWidth*.04),
//               child: AppText(
//                 text: context.localizations.choose,
//                 align: TextAlign.center,
//                 fontWeight: FontWeight.bold,
//                 maxLines: 3,
//                 textSize: 22,
//                 color: AppColors.black,
//               ),
//             ),
//             Padding(
//               padding: screenPadding(padding: SizeConfig.screenWidth*.04),
//               child: AppText(
//                 text: context.localizations.choose,
//                 align: TextAlign.center,
//                 fontWeight: FontWeight.bold,
//                 maxLines: 3,
//                 textSize: 22,
//                 color: AppColors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
