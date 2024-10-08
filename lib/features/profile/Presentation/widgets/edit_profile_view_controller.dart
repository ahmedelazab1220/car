import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/config/helper/helper.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/profile/Presentation/manager/edit%20cubit/edit_profile_cubit.dart';
import 'package:car_help/features/profile/Presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:car_help/features/profile/Presentation/widgets/edit_profile_client_view_body.dart';
import 'package:car_help/features/profile/Presentation/widgets/edit_profile_provider_view_body.dart';
import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/snackbar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfileViewController extends StatefulWidget {
  final UserEntity data;
  const EditProfileViewController({super.key, required this.data});

  @override
  State<EditProfileViewController> createState() =>
      _EditProfileViewControllerState();
}

class _EditProfileViewControllerState extends State<EditProfileViewController> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(getIt.get<ProfileRepoImpl>()),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileLoading) {
            isLoading = true;
          } else if (state is EditProfileFailure) {
            isLoading = false;
            snackbarError(context, state.errorMessage);
          } else if (state is EditProfileSuccess) {
            isLoading = false;
            snackbarSuccess(context, state.message);
            BlocProvider.of<ProfileCubit>(context).getProfileData(remote: true);
            GoRouter.of(context).pop();
          } else if (state is DeleteAccountSuccess) {
            isLoading = false;
            CacheHelper().deleteCache();
            refreshMessagesToken();
            GoRouter.of(context).pushReplacement(AppRouter.kStartView);
          }
        },
        builder: (context, state) {
          if (widget.data.userType == AppStrings.client) {
            return ModalProgressHUD(
                inAsyncCall: isLoading,
                child: EditProfileClientViewBody(
                  data: widget.data,
                ));
          } else {
            return ModalProgressHUD(
                inAsyncCall: isLoading,
                child: EditProfileProviderViewBody(
                  data: widget.data,
                ));
          }
        },
      ),
    );
  }
}
