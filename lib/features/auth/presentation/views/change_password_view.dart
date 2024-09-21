import 'package:car_help/features/auth/presentation/widgets/change_password_view_body.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).changePassword),
      ),
      body: const SafeArea(
        child: ChangePasswordViewBody(),
      ),
    );
  }
}
