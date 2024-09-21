import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/settings/data/repos/settings_repo_impl.dart';
import 'package:car_help/features/settings/presentation/manager/contact%20cubit/contact_us_cubit.dart';
import 'package:car_help/features/settings/presentation/widgets/contact_us_view_body.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/snackbar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ContactUsViewBloc extends StatefulWidget {
  const ContactUsViewBloc({super.key});

  @override
  State<ContactUsViewBloc> createState() => _ContactUsViewBlocState();
}

class _ContactUsViewBlocState extends State<ContactUsViewBloc> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(
        getIt.get<SettingsRepoImpl>(),
      ),
      child: BlocConsumer<ContactUsCubit, ContactUsState>(
        listener: (context, state) {
          if (state is ContactUsLoading) {
            isLoading = true;
          } else if (state is ContactUsSuccess) {
            isLoading = false;
            snackbarSuccess(context, state.message);
            GoRouter.of(context).pop();
          } else if (state is ContactUsFailure) {
            isLoading = false;
            snackbarError(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: const ContactUsViewBody(),
          );
        },
      ),
    );
  }
}
