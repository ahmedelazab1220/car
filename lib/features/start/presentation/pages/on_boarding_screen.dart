// import 'package:car_help/features/widgets/app_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:car_help/config/helper/locale_helper/app_local.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_constant.dart';

// import 'welcome_screen.dart';

// class OnBoardingScreen extends StatelessWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<StartCubit, StartState>(
//       listener: (context, state) {
//         if (state is StartAppState) {
//           if (StartCubit.get(context).isLast) {
//             if (state.isGuest) {
//               AppConstant.navigateToAndFinish(
//                   context, const ClientMainLayout());
//             } else {
//               AppConstant.navigateToAndFinish(context, const WelcomeScreen());
//             }
//           } else {
//             AppConstant.navigateToAndFinish(context, const WelcomeScreen());
//           }
//         }
//       },
//       builder: (context, state) {
//         StartCubit cubit = StartCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(
//             actions: [
//               TextButton(
//                 onPressed: () => cubit.submit(isGuest: true),
//                 child: AppText(
//                     text: context.localizations.skip,
//                     textSize: 14.0,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.black),
//               )
//             ],
//           ),
//           body: const Body(),
//         );
//       },
//     );
//   }
// }
