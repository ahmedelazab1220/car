import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/auth/presentation/manager/otp%20verification%20cubit/otp_verification_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/otp_verification_view_body.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OtpVerificationViewBloc extends StatefulWidget {
  final List list;
  const OtpVerificationViewBloc({
    super.key,
    required this.list,
  });

  @override
  State<OtpVerificationViewBloc> createState() =>
      _OtpVerificationViewBlocState();
}

class _OtpVerificationViewBlocState extends State<OtpVerificationViewBloc> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpVerificationCubit(
        getIt.get<AuthRepoImpl>(),
      ),
      child: BlocConsumer<OtpVerificationCubit, OtpVerificationState>(
        listener: (context, state) {
          if (state is OtpVerificationLoading) {
            isLoading = true;
          } else if (state is OtpVerificationSuccess) {
            isLoading = false;
            GoRouter.of(context).pop();
            GoRouter.of(context).pushReplacement(
              state.entity.userType == AppStrings.provider
                  ? AppRouter.kProviderLayout
                  : AppRouter.kClientLayout,
            );
          } else if (state is OtpVerificationFailure) {
            isLoading = false;
            snackbarError(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: OtpVerificationViewBody(
              list: widget.list,
            ),
          );
        },
      ),
    );
  }
}
