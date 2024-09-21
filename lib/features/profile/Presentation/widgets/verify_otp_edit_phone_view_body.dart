// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wahed/core/utils/app_colors.dart';
// import 'package:wahed/core/utils/app_size.dart';
// import 'package:wahed/core/utils/app_styles.dart';
// import 'package:wahed/features/auth/presentation/widgets/otp_field.dart';
// import 'package:wahed/features/profile/Presentation/manager/send%20otp%20edit%20phone%20cubit/send_otp_edit_phone_cubit.dart';
// import 'package:wahed/features/profile/Presentation/manager/verify%20otp%20edit%20phone%20cubit/verify_otp_edit_phone_cubit.dart';
// import 'package:wahed/features/widgets/custom_back_appbar.dart';
// import 'package:wahed/features/widgets/custom_botton.dart';
// import 'package:wahed/generated/l10n.dart';

// class VeriftOtpEditPhoneViewBody extends StatefulWidget {
//   final String phone;
//   const VeriftOtpEditPhoneViewBody({super.key, required this.phone});

//   @override
//   State<VeriftOtpEditPhoneViewBody> createState() =>
//       _VeriftOtpEditPhoneViewBodyState();
// }

// class _VeriftOtpEditPhoneViewBodyState
//     extends State<VeriftOtpEditPhoneViewBody> {
//   TextEditingController otpController = TextEditingController();
//   bool isValid = false;
//   Timer? _timer;
//   int _start = 30; // Set the countdown time in seconds
//   bool _canResend = false;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     _canResend = false;
//     _start = 30;
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_start == 0) {
//         setState(() {
//           _canResend = true;
//         });
//         timer.cancel();
//       } else {
//         setState(() {
//           _start--;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const CustomBackAppbar(title: ''),
//                 SizedBox(
//                   height: SizeConfig.bodyHeight * 0.04,
//                 ),
//                 Text(
//                   S.of(context).enterVerificationCode,
//                   style: AppStyles.textStyle24_700,
//                 ),
//                 SizedBox(
//                   height: SizeConfig.bodyHeight * 0.01,
//                 ),
//                 Text(
//                   S.of(context).weSentSMStoThisNumber,
//                   style: AppStyles.textStyle14_600Grey,
//                 ),
//                 SizedBox(
//                   height: SizeConfig.bodyHeight * 0.01,
//                 ),
//                 Text(
//                   widget.phone,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: AppColors.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: SizeConfig.bodyHeight * 0.02,
//             ),
//             OtpField(
//               controller: otpController,
//               onCompleted: (pin) {
//                 final otpCode = otpController.text.trim();
//                 if (otpCode.isNotEmpty) {
//                   setState(() {
//                     isValid = true;
//                   });
//                 }
//               },
//             ),
//             SizedBox(
//               height: SizeConfig.bodyHeight * 0.04,
//             ),
//             CustomButton(
//               width: double.maxFinite,
//               colors: isValid
//                   ? null
//                   : [
//                       AppColors.primaryYellow.withOpacity(0.6),
//                       AppColors.primaryYellow.withOpacity(0.6)
//                     ],
//               margin: const EdgeInsets.all(0),
//               title: S.of(context).sendVerificationCode,
//               onPressd: isValid
//                   ? () {
//                       BlocProvider.of<VerifyOtpEditPhoneCubit>(context)
//                           .verifyOtpEditPhone(
//                         phone: widget.phone,
//                         otpCode: otpController.text,
//                       );
//                     }
//                   : null,
//             ),
//             SizedBox(
//               height: SizeConfig.bodyHeight * 0.02,
//             ),
//             Text(
//               S.of(context).notReceivedTheVerificationCode,
//               style: AppStyles.textStyle14_600Grey,
//             ),
//             SizedBox(
//               height: SizeConfig.bodyHeight * 0.02,
//             ),
//             if (!_canResend)
//               Text(
//                 '$_start',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: AppColors.primary,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             GestureDetector(
//               onTap: _canResend
//                   ? () {
//                       startTimer();
//                       BlocProvider.of<SendOtpEditPhoneCubit>(context)
//                           .sendOtpEditPhone(
//                         phone: widget.phone,
//                       );
//                     }
//                   : null,
//               child: Text(
//                 S.of(context).resendTheCode,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: _canResend ? AppColors.primary : AppColors.grey,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: SizeConfig.bodyHeight * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
