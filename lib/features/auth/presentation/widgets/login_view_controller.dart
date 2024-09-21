import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:car_help/features/auth/presentation/manager/send%20otp%20cubit/send_otp_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/login_view_body.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/snackbar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewController extends StatefulWidget {
  const LoginViewController({super.key});

  @override
  State<LoginViewController> createState() => _LoginViewControllerState();
}

class _LoginViewControllerState extends State<LoginViewController> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          GoRouter.of(context).pop();
          GoRouter.of(context).pushReplacement(
            state.data.userType == AppStrings.provider
                ? AppRouter.kProviderLayout
                : AppRouter.kClientLayout,
          );
        } else if (state is LoginFailure) {
          isLoading = false;
          snackbarError(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
