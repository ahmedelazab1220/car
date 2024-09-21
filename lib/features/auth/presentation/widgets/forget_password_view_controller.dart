import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/auth/presentation/manager/send%20otp%20cubit/send_otp_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/forget_password_view_body.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/snackbar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordViewController extends StatefulWidget {
  const ForgetPasswordViewController({super.key});

  @override
  State<ForgetPasswordViewController> createState() =>
      _ForgetPasswordViewControllerState();
}

class _ForgetPasswordViewControllerState
    extends State<ForgetPasswordViewController> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendOtpCubit, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpLoading) {
          isLoading = true;
        } else if (state is SendOtpSuccess) {
          isLoading = false;
          GoRouter.of(context)
              .push(AppRouter.kOtpVerificationView, extra: [state.phone]);
          snackbarSuccess(context, state.message!);
        } else if (state is SendOtpFailure) {
          isLoading = false;
          snackbarError(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: const ForgetPasswordViewBody(),
        );
      },
    );
  }
}
