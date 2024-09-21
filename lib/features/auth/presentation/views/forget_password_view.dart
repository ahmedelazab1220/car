import 'package:car_help/features/auth/presentation/widgets/forget_password_view_controller.dart';
import 'package:car_help/features/auth/presentation/widgets/login_view_bloc.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ForgetPasswordViewController(),
    );
  }
}
