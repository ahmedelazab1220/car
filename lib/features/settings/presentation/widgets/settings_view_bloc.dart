import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/features/auth/presentation/manager/logout%20cubit/logout_cubit.dart';
import 'package:car_help/features/settings/presentation/widgets/settings_view_body.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SettingsVewBloc extends StatefulWidget {
  final String userType;
  const SettingsVewBloc({super.key, required this.userType});

  @override
  State<SettingsVewBloc> createState() => _SettingsVewBlocState();
}

class _SettingsVewBlocState extends State<SettingsVewBloc> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutLoading) {
          GoRouter.of(context).pop();
          isLoading = true;
        } else if (state is LogoutSuccess) {
          isLoading = false;
          CacheHelper().deleteCache();
          // refreshMessagesToken();
          GoRouter.of(context).pushReplacement(AppRouter.kStartView);
        } else if (state is LogoutFailure) {
          isLoading = false;
          snackbarError(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SettingsViewBody(userType: widget.userType),
        );
      },
    );
  }
}
