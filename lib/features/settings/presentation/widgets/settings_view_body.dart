import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/auth/presentation/manager/logout%20cubit/logout_cubit.dart';
import 'package:car_help/features/settings/presentation/settings_helper.dart';
import 'package:car_help/features/settings/presentation/widgets/head_profile_widget.dart';
import 'package:car_help/features/settings/presentation/widgets/settings_bottom.dart';
import 'package:car_help/features/settings/presentation/widgets/toggle_notifications_bottons.dart';
import 'package:car_help/features/start/presentation/splash_helper.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsViewBody extends StatelessWidget {
  final String userType;
  const SettingsViewBody({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  S.of(context).more,
                  style: AppStyles.textStyle18_900,
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            HeedProfileWidget(
              userType: userType,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              S.of(context).general,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.textStyle16_800.copyWith(
                color: AppColors.primary,
              ),
            ),
            // if (userType != AppStrings.both)
            // SettingsButtom(
            //   title: S.of(context).orderHistory,
            //   icon: Icon(
            //     Iconsax.receipt_edit,
            //     color: AppColors.grey,
            //   ),
            //   onTap: () => GoRouter.of(context).push(
            //     AppRouter.kOrederHistoryView,
            //   ),
            // ),
            SettingsButtom(
              onTap: () => SplashHelper.showBottomSheetDialog(context: context),
              title: S.of(context).chooseLanguage,
              subTitle: S.of(context).changeLanguage,
              icon: AppAssets.language,
            ),
            const SizedBox(height: 12),
            SettingsButtom(
              onTap: () => GoRouter.of(context).push(AppRouter.kFavoritesView),
              title: S.of(context).myFavorites,
              subTitle: S.of(context).myFavoritesDescription,
              icon: AppAssets.favouriteIcon,
            ),
            const SizedBox(height: 12),
            const ToggleNotificationsButtons(),

            Text(
              S.of(context).more,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.textStyle16_800.copyWith(
                color: AppColors.primary,
              ),
            ),
            SettingsButtom(
              title: S.of(context).aboutapp,
              onTap: () => GoRouter.of(context).push(AppRouter.kAboutUs),
              icon: AppAssets.terms,
              subTitle: S.of(context).moreInformation,
            ),
            SettingsButtom(
              title: S.of(context).contactUs,
              subTitle: S.of(context).moreInformation,
              icon: AppAssets.call,
              onTap: () => GoRouter.of(context).push(
                AppRouter.kContactUsView,
              ),
            ),
            SettingsButtom(
              title: S.of(context).termsAndConditions,
              onTap: () =>
                  GoRouter.of(context).push(AppRouter.kTermsAndConditions),
              icon: AppAssets.terms,
            ),
            if (userType == AppStrings.both)
              CustomButton(
                margin: const EdgeInsets.only(top: 12),
                title: S.of(context).login,
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kStartView);
                },
              )
            else
              CustomButton(
                margin: const EdgeInsets.only(top: 36),
                title: S.of(context).logout,
                onPressed: () {
                  SettingsHelper.showCustomDialog(
                    context: context,
                    title: S.of(context).logout,
                    onPressd: () =>
                        BlocProvider.of<LogoutCubit>(context).logout(),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
