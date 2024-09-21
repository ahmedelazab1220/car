import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/features/auth/presentation/widgets/register_view_bloc.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(child: RegisterViewBloc()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: S.of(context).alreadyHaveAccount,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              textSize: 14,
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () => GoRouter.of(context).pop(),
              child: AppText(
                text: S.of(context).login,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                textSize: 14,
                textDecoration: TextDecoration.underline,
              ),
            )
          ],
        ),
      ),
    );
  }
}
