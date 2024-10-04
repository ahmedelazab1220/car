import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:car_help/features/auth/presentation/manager/send%20otp%20cubit/send_otp_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/login_view_body.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/presentation/manager/exhibits%20cubit/exhibits_cubit.dart';
import 'package:car_help/features/exhibits/presentation/widgets/add_exhibit_view_body.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/snackbar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddExhibitViewController extends StatefulWidget {
  final ExhibitsEntity? data;

  const AddExhibitViewController({super.key, this.data});

  @override
  State<AddExhibitViewController> createState() =>
      _AddExhibitViewControllerState();
}

class _AddExhibitViewControllerState extends State<AddExhibitViewController> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExhibitsCubit, ExhibitsState>(
      listener: (context, state) {
        if (state is ExhibitsLoading) {
          isLoading = true;
        } else if (state is AddExhibitSuccess) {
          isLoading = false;

          GoRouter.of(context).pop();
          snackbarSuccess(context, state.message);
        } else if (state is AddExhibitFailure) {
          isLoading = false;
          snackbarError(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: AddExhibitViewBody(
            data: widget.data,
          ),
        );
      },
    );
  }
}
