// import 'package:car_help/config/helper/locale_helper/app_local.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:car_help/widgets/app_text.dart';
// import 'package:flutter/material.dart';

// class SplashContent extends StatelessWidget {
//   const SplashContent({
//     super.key,
//     required this.text,
//     required this.image,
//     this.isWelcome = false,
//   });

//   final String text, image;
//   final bool isWelcome;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Image.asset(image, fit: BoxFit.cover,width: double.infinity,),
//         Visibility(
//             visible: isWelcome,
//             child: SizedBox(height: SizeConfig.bodyHeight * .1)),
//         Padding(
//           padding: screenPadding(padding: SizeConfig.screenWidth * .04),
//           child: AppText(
//             text: text,
//             align: TextAlign.center,
//             fontWeight: FontWeight.w600,
//             maxLines: 3,
//             textSize: 18,
//             color: AppColors.black,
//           ),
//         ),
//         SizedBox(height: SizeConfig.bodyHeight * .04),
//       ],
//     );
//   }
// }
