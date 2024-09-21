// import 'package:car_help/config/helper/locale_helper/app_localizations_extension.dart';
// import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_cubit.dart';
// import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_state.dart';
// import 'package:car_help/features/start/splash_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/features/start/presentation/widgets/welcome_body.dart';
// import 'package:car_help/widgets/app_text.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           BlocBuilder<LocaleCubit, LocaleState>(
//             builder: (context, state) {
//               return TextButton(
//                 onPressed: () => SplashHelper().showLanguageDialog(context: context),
//                 child: AppText(
//                    text:context.localizations.language,
//                     textSize: 14.0,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.black),
//               );
//             },
//           )
//         ],
//         automaticallyImplyLeading: false,
//       ),
//       body: const WelcomeBody(),
//     );
//   }
// }
