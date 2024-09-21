// import 'package:car_help/config/helper/locale_helper/app_localizations_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:car_help/config/helper/locale_helper/app_local.dart';
// import 'package:car_help/core/utils/app_assets.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:car_help/widgets/app_text.dart';
// import 'package:car_help/widgets/custom_button.dart';

// class NoNetworkDialogBody extends StatefulWidget {
//   const NoNetworkDialogBody({super.key});

//   @override
//   State<NoNetworkDialogBody> createState() => _NoNetworkDialogBodyState();
// }

// class _NoNetworkDialogBodyState extends State<NoNetworkDialogBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: SizeConfig.bodyHeight * .02),
//         AppText(
//           text: context.localizations.choose,
//           fontWeight: FontWeight.bold,
//           color: AppColors.black,
//           maxLines: 3,
//           align: TextAlign.center,
//           textSize: 16,
//         ),
//         SizedBox(height: SizeConfig.bodyHeight * .04),
//         SvgPicture.asset(AppAssets.noNetworkIcon),
//         SizedBox(height: SizeConfig.bodyHeight * .04),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*.1),
//           child: CustomButton(text:context.localizations.choose, press: () {
//             Navigator.pop(context);
//             Future.delayed(const Duration(seconds: 2),() async {
//             if(mounted){
//               Navigator.pop(context);
//             }
//             },);
//           }),
//         ),
//         SizedBox(height: SizeConfig.bodyHeight * .06),
//       ],
//     );
//   }
// }
