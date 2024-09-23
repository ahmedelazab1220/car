import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_cubit.dart';
import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_state.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/start/presentation/splash_helper.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  TextButton(
                    child: Text(
                      state.localeCode == 'ar'
                          ? S.of(context).arabic
                          : S.of(context).english,
                      style: AppStyles.textStyle16_800.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    onPressed: () => SplashHelper.showBottomSheetDialog(
                      context: context,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: SizeConfig.bodyHeight * 0.09,
              ),
              SizedBox(
                height: SizeConfig.bodyHeight * 0.2,
                child: Image.asset(
                  AppAssets.appLogo,
                ),
              ),
              SizedBox(
                height: SizeConfig.bodyHeight * 0.08,
              ),
              Text(
                S.of(context).welcome,
                style: AppStyles.textStyle24_700,
              ),
              SizedBox(
                height: SizeConfig.bodyHeight * 0.01,
              ),
              Text(
                S.of(context).letsStart,
                style: AppStyles.textStyle14_400,
              ),
              const Spacer(),
              SizedBox(
                height: SizeConfig.bodyHeight * 0.01,
              ),
              CustomButton(
                title: S.of(context).client,
                onPressed: () => GoRouter.of(context).push(
                  AppRouter.kLoginView,
                ),
              ),
              CustomButton(
                title: S.of(context).provider,
                onPressed: () => GoRouter.of(context).push(
                  AppRouter.kLoginView,
                ),
                color: Colors.black,
                titleColor: AppColors.white,
                borderColor: AppColors.primary,
              ),
              TextButton(
                onPressed: () =>
                    GoRouter.of(context).pushReplacement(AppRouter.kBothLayout),
                child: Text(
                  S.of(context).guest,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
  }
}
