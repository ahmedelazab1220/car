// ignore_for_file: unused_field

import 'dart:async';

import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/auth/presentation/manager/otp%20verification%20cubit/otp_verification_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/otp_field.dart';
import 'package:car_help/features/auth/presentation/widgets/resend_code_widget.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVerificationViewBody extends StatefulWidget {
  final List list;
  const OtpVerificationViewBody({super.key, required this.list});

  @override
  State<OtpVerificationViewBody> createState() =>
      _OtpVerificationViewBodyState();
}

class _OtpVerificationViewBodyState extends State<OtpVerificationViewBody> {
  TextEditingController otpController = TextEditingController();
  bool isValid = false;
  Timer? _timer;
  int _start = 30; // Set the countdown time in seconds
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _canResend = false;
    _start = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            text: S.of(context).phoneVerification,
            align: TextAlign.center,
            fontWeight: FontWeight.bold,
            textSize: 22,
            color: AppColors.black,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .04),
          AppText(
            text: "${S.of(context).phoneVerificationBody} ${widget.list[0]}",
            align: TextAlign.center,
            fontWeight: FontWeight.w400,
            maxLines: 3,
            color: Colors.grey,
            textSize: 14,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .04),
          OtpField(
            controller: otpController,
            onCompleted: (pin) {
              final otpCode = otpController.text.trim();
              if (otpCode.isNotEmpty) {
                setState(() {
                  isValid = true;
                });
              }
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .06),
          CustomButton(
            margin: const EdgeInsets.all(0),
            width: double.maxFinite,
            colors: isValid
                ? null
                : [
                    AppColors.primaryYellow.withOpacity(0.6),
                    AppColors.primaryYellow.withOpacity(0.6)
                  ],
            title: S.of(context).verify,
            onPressed: isValid
                ? () {
                    BlocProvider.of<OtpVerificationCubit>(context)
                        .otpVerification(
                      phone: widget.list[0],
                      otpCode: otpController.text,
                    );
                  }
                : null,
          ),
          // CustomButton(
          //     color: ,
          //     title: S.of(context).verify,
          //     onPressed: () => cubit.verifyPinCode(
          //         otp: otp.text, phoneNumber: cubit.phoneNumber)),
          const Spacer(),
          ResendCodeWidget(
            phone: widget.list[0],
          ),
        ],
      ),
    );
  }
}
