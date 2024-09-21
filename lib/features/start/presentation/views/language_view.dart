// import 'package:car_help/config/function/app_router.dart';
// import 'package:car_help/core/utils/app_assets.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:car_help/core/utils/app_styles.dart';
// import 'package:car_help/features/start/presentation/widgets/custom_drop_down_language.dart';
// import 'package:car_help/features/widgets/custom_button.dart';
// import 'package:car_help/generated/l10n.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';

// class LanguageView extends StatelessWidget {
//   const LanguageView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: SizeConfig.bodyHeight * 0.5,
//             ),
//             Center(
//                 child: SvgPicture.asset(
//               AppAssets.appLogo,
//             )),
//             const Spacer(),
//             Text(S.of(context).changeLanguage,
//                 style: AppStyles.textStyle20_700),
//             const SizedBox(
//               height: 20,
//             ),
//             const CustomDropDownLanguage(),
//             const SizedBox(
//               height: 10,
//             ),
//             CustomButton(
//               title: S.of(context).next,
//               onPressed: () =>
//                   GoRouter.of(context).push(AppRouter.kOnBoardingView),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
