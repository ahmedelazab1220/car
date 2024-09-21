// import 'package:car_help/config/helper/locale_helper/app_local.dart';
// import 'package:car_help/config/helper/locale_helper/app_localizations_extension.dart';
// import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_cubit.dart';
// import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_state.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:car_help/features/widgets/app_text.dart';
// import 'package:car_help/widgets/app_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ErrorScreen extends StatelessWidget {
//   final String problemTitle;

//   const ErrorScreen({Key? key, required this.problemTitle}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LocaleCubit, LocaleState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: SizeConfig.bodyHeight * .2),
//               Center(
//                 child: Icon(
//                   Icons.warning_amber_rounded,
//                   color: AppColors.primary,
//                   size: SizeConfig.bodyHeight * .25,
//                 ),
//               ),
//               AppText(
//                 text: context.localizations.choose,
//                 textSize: 25,
//                 fontWeight: FontWeight.w700,
//               ),
//               AppText(
//                 text: context.localizations.choose,
//                 fontWeight: FontWeight.w500,
//               ),
//               SizedBox(height: SizeConfig.bodyHeight * .02),
//               AppText(
//                 text: context.localizations.choose,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.hint,
//               ),
//               Container(
//                 height: 55,
//                 width: SizeConfig.screenWidth * 0.55,
//                 margin: const EdgeInsets.symmetric(vertical: 15),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       foregroundColor: Theme.of(context).primaryColor,
//                       backgroundColor: AppColors.primary,
//                       elevation: 500,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50))),
//                   child: Text(
//                     context.localizations.choose,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700),
//                   ),
//                   onPressed: () {},
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
