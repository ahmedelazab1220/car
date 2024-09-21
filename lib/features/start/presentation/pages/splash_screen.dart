// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/features/start/presentation/pages/on_boarding_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:car_help/core/utils/app_assets.dart';
// import 'package:car_help/core/utils/app_constant.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:car_help/features/start/presentation/cubit/start_cubit.dart';
// import 'package:car_help/features/start/splash_helper.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return BlocConsumer<StartCubit, StartState>(
//       listener: (context, state) {
//         if (state is InitAppSuccess) {
//           AppConstant.navigateToAndFinish(context, state.widget);
//         } else if (state is InitAppError) {
//           SplashHelper().showNoNetwork(context: context);
//         }
//       },
//       builder: (context, state) {
//         return AnimatedSplashScreen(
//           backgroundColor: AppColors.primary,
//           splashIconSize: SizeConfig.bodyHeight*.2,
//           splash: Image.asset(
//             AppAssets.appLogo,
//           ),
//           nextScreen: const OnBoardingScreen(),
//           splashTransition: SplashTransition.sizeTransition,
//           //  pageTransitionType: PageTransitionType.bottomToTopJoined,
//           duration: 20,
//         );
//       },
//     );
//   }
// }
