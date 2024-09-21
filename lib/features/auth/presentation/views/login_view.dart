import 'package:car_help/features/auth/presentation/widgets/login_view_bloc.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LoginViewBloc(),
    );
  }
}
