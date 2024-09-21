// import 'package:car_help/features/widgets/app_text.dart';
// import 'package:flutter/material.dart';
// import 'package:car_help/config/helper/locale_helper/app_local.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_constant.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:car_help/features/start/presentation/pages/welcome_screen.dart';

// class GuestDialogBody extends StatelessWidget {
//   const GuestDialogBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         AppText(
//           text: .choose,
//           fontWeight: FontWeight.bold,
//           textSize: 16,
//           color: AppColors.black,
//         ),
//         SizedBox(height: SizeConfig.bodyHeight * .02),
//         AppText(
//           text: context.localizations.choose,
//           fontWeight: FontWeight.w400,
//           textSize: 13,
//           color: const Color(0xffA0A0A0),
//         ),
//         SizedBox(height: SizeConfig.bodyHeight * .04),
//         CustomButton(
//             text: context.localizations.choose,
//             press: ()=>AppConstant.navigateToAndFinish(context, const WelcomeScreen())),
//         SizedBox(height: SizeConfig.bodyHeight * .03),
//         GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Center(
//                 child: AppText(
//                   text: context.localizations.choose,
//                   color: AppColors.primary,
//                   fontWeight: FontWeight.bold,
//                   textSize: 16,
//                 ))),
//       ],
//     );
//   }
// }
