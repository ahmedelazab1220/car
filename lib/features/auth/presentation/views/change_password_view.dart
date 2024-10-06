import 'package:car_help/features/auth/presentation/widgets/change_password_view_controller.dart';
import 'package:car_help/features/widgets/custom_app_bar%20copy.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).changePassword),
      body: const SafeArea(
        child: ChangePasswordViewController(),
      ),
    );
  }
}
