import 'package:car_help/features/auth/presentation/manager/send%20otp%20cubit/send_otp_cubit.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendCodeWidget extends StatelessWidget {
  final String phone;
  const ResendCodeWidget({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<SendOtpCubit>(context).sendOtpCode(
        phone: phone,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: S.of(context).notReceiveCoding,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            textSize: 14,
          ),
          const SizedBox(width: 5),
          AppText(
            text: S.of(context).resend,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            textSize: 14,
            textDecoration: TextDecoration.underline,
          )
        ],
      ),
    );
  }
}
