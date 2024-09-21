import 'package:car_help/features/auth/presentation/widgets/otp_verification_view_bloc.dart';
import 'package:flutter/material.dart';

class OtpVerificationView extends StatelessWidget {
  final List list;
  const OtpVerificationView({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: OtpVerificationViewBloc(
          list: list,
        ),
      ),
    );
  }
}
