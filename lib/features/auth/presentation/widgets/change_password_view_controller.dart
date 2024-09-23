import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/auth/presentation/manager/change%20password%20cubit/change_password_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/change_password_view_body.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/snackbar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChangePasswordViewController extends StatefulWidget {
  const ChangePasswordViewController({super.key});

  @override
  State<ChangePasswordViewController> createState() =>
      _ChangePasswordViewControllerState();
}

class _ChangePasswordViewControllerState
    extends State<ChangePasswordViewController> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(getIt.get<AuthRepoImpl>()),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordLoading) {
            isLoading = true;
          } else if (state is ChangePasswordSuccess) {
            isLoading = false;
            GoRouter.of(context).pop();
            snackbarSuccess(context, state.message);
          } else if (state is ChangePasswordFailed) {
            isLoading = false;
            snackbarError(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: const ChangePasswordViewBody(),
          );
        },
      ),
    );
  }
}
