// import 'package:animate_do/animate_do.dart';
// import 'package:car_help/config/helper/locale_helper/app_localizations_extension.dart';
// import 'package:car_help/features/home_company/presentation/pages/company_layout.dart';
// import 'package:car_help/features/main/presentation/layout/client_main_layout.dart';
// import 'package:car_help/features/main/presentation/layout/provider_main_layout.dart';
// import 'package:car_help/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:car_help/core/utils/app_assets.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_constant.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:car_help/features/auth/presentation/pages/login_screen.dart';
// import 'package:car_help/features/start/presentation/cubit/start_cubit.dart';
// import 'package:car_help/widgets/app_text.dart';

// class WelcomeBody extends StatefulWidget {
//   const WelcomeBody({super.key});

//   @override
//   State<WelcomeBody> createState() => _WelcomeBodyState();
// }

// class _WelcomeBodyState extends State<WelcomeBody> {
//   @override
//   void initState() {
//     BlocProvider.of<StartCubit>(context).requestNotificationPermission();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<StartCubit, StartState>(
//       listener: (context, state) {
//         if (state is ChooseAccountTypeState) {
//           AppConstant.navigateTo(
//               context,
//               LoginScreen(
//                 isCompany: state.isCompany,
//               ));
//         }
//       },
//       builder: (context, state) {
//         StartCubit cubit = StartCubit.get(context);
//         return Column(
//           children: [
//             SizedBox(height: SizeConfig.bodyHeight * .25),
//             ElasticInDown(
//                 child: Image.asset(
//               AppAssets.appLogo,
//               width: double.infinity,
//               height: SizeConfig.bodyHeight * .2,
//             )),
//             SizedBox(height: SizeConfig.bodyHeight * .08),
//             AppText(
//               text: context.localizations.welcome,
//               align: TextAlign.center,
//               fontWeight: FontWeight.bold,
//               maxLines: 3,
//               textSize: 26,
//               color: AppColors.black,
//             ),
//             SizedBox(height: SizeConfig.bodyHeight * .02),
//             AppText(
//               text: context.localizations.letsStart,
//               align: TextAlign.center,
//               maxLines: 1,
//               textSize: 14,
//               color: AppColors.black,
//             ),
//             SizedBox(height: SizeConfig.bodyHeight * .08),
//             Bounce(
//               child: Padding(
//                 padding: screenPadding(),
//                 child: CustomButton(
//                     text: context.localizations.client,
//                     press: () async =>
//                         cubit.chooseAccountType(isCompany: false)),
//               ),
//             ),
//             SizedBox(height: SizeConfig.bodyHeight * .02),
//             Bounce(
//               child: Padding(
//                 padding: screenPadding(),
//                 child: CustomButton(
//                     text: context.localizations.provider,
//                     press: () async => cubit.chooseAccountType(isCompany: true),
//                     backgroundColor: AppColors.black,
//                     textColor: Colors.white,
//                     borderColor: AppColors.black),
//               ),
//             ),
//             SizedBox(height: SizeConfig.bodyHeight * .03),
//             GestureDetector(
//               onTap: () => AppConstant.navigateToAndFinish(
//                   context, const ClientMainLayout()),
//               child: AppText(
//                 text: context.localizations.guest,
//                 align: TextAlign.center,
//                 fontWeight: FontWeight.w600,
//                 maxLines: 3,
//                 textSize: 18,
//                 color: AppColors.black,
//               ),
//             ),
//             SizedBox(height: SizeConfig.bodyHeight * .06),
//           ],
//         );
//       },
//     );
//   }
// }
