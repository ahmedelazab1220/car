import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/features/profile/Presentation/manager/send%20otp%20edit%20phone%20cubit/send_otp_edit_phone_cubit.dart';
import 'package:car_help/features/profile/Presentation/widgets/edit_phone_view_body.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditPhoneViewBloc extends StatefulWidget {
  final List phone;
  const EditPhoneViewBloc({super.key, required this.phone});

  @override
  State<EditPhoneViewBloc> createState() => _EditPhoneViewBlocState();
}

class _EditPhoneViewBlocState extends State<EditPhoneViewBloc> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendOtpEditPhoneCubit, SendOtpEditPhoneState>(
      listener: (context, state) {
        if (state is SendOtpEditPhoneLoading) {
          isLoading = true;
        } else if (state is SendOtpEditPhoneSuccess) {
          isLoading = false;
          GoRouter.of(context).pushReplacement(
              AppRouter.kVerifyOtpEditPhoneView,
              extra: state.phone);
        } else if (state is SendOtpEditPhoneFailure) {
          isLoading = false;
          snackbarError(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: EditPhoneViewBody(
            phone: widget.phone,
          ),
        );
      },
    );
  }
}
