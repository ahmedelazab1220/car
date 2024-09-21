// import 'package:car_help/config/helper/locale_helper/app_localizations_extension.dart';
// import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_cubit.dart';
// import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_state.dart';
// import 'package:car_help/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:car_help/widgets/app_text.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LanguageDialogDesignBody extends StatelessWidget {
//   const LanguageDialogDesignBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LocaleCubit, LocaleState>(
//       listener: (context, state) {
//         if (state is ChangeLocaleState) {
//           Future.delayed(
//               const Duration(milliseconds: 20), () => Navigator.pop(context));
//         }
//       },
//       builder: (context, state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: SizeConfig.bodyHeight * .02),
//             Container(
//               width: SizeConfig.screenWidth * .2,
//               height: 5,
//               decoration: BoxDecoration(
//                   color: AppColors.grey,
//                   borderRadius: BorderRadius.circular(20)),
//             ),
//             SizedBox(height: SizeConfig.bodyHeight * .04),
//             AppText(
//               text: context.localizations.chooseLang,
//               fontWeight: FontWeight.bold,
//               textSize: 16,
//               color: AppColors.black,
//             ),
//             SizedBox(height: SizeConfig.bodyHeight * .04),
//             Padding(
//               padding: screenPadding(),
//               child: CustomButton(
//                   text: context.localizations.arabic,
//                   backgroundColor: AppColors.black,
//                   borderColor: AppColors.black,
//                   textColor: Colors.white,
//                   press: () async =>
//                       BlocProvider.of<LocaleCubit>(context).changeLanguage(2)),
//             ),
//             SizedBox(height: SizeConfig.bodyHeight * .02),
//             Padding(
//               padding: screenPadding(),
//               child: CustomButton(
//                 backgroundColor: Colors.transparent,
//                 borderColor: AppColors.black,
//                 textColor: Colors.black,
//                 text: context.localizations.english,
//                 press: () async =>
//                     BlocProvider.of<LocaleCubit>(context).changeLanguage(1),
//               ),
//             ),
//             SizedBox(height: SizeConfig.bodyHeight * .04),
//           ],
//         );
//       },
//     );
//   }
// }
