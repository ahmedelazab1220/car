import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/auth/presentation/manager/register%20cubit/register_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/register_client_view_body.dart';
import 'package:car_help/features/auth/presentation/widgets/register_provider_view_body.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/tabbar.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewController extends StatefulWidget {
  const RegisterViewController({super.key});

  @override
  State<RegisterViewController> createState() => _RegisterViewControllerState();
}

class _RegisterViewControllerState extends State<RegisterViewController> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        getIt.get<AuthRepoImpl>(),
      ),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            isLoading = true;
          } else if (state is RegisterSuccess) {
            isLoading = false;
            GoRouter.of(context).pop();
            GoRouter.of(context).pushReplacement(
              state.data.userType == AppStrings.provider
                  ? AppRouter.kProviderLayout
                  : AppRouter.kClientLayout,
            );
          } else if (state is RegisterFailure) {
            isLoading = false;
            snackbarError(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    AppText(
                      text: S.of(context).createAccount,
                      align: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      textSize: 22,
                      color: AppColors.black,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .04),
                    AppText(
                      text: S.of(context).createAccountBody,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w400,
                      maxLines: 3,
                      color: Colors.grey,
                      textSize: 14,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .04),
                    Tabbar(views: const [
                      RegisterClientViewBody(),
                      RegisterProviderViewBody(),
                    ], tabs: [
                      Tab(
                        height: 65,
                        text: S.of(context).client,
                      ),
                      Tab(
                        height: 65,
                        text: S.of(context).provider,
                      )
                    ])
                  ],
                ),
              ));
        },
      ),
    );
  }
}
