import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_cubit.dart';
import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_state.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottonsLanguage extends StatelessWidget {
  final bool? isLocale;
  const CustomBottonsLanguage({super.key, this.isLocale});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomButton(
                borderColor: AppColors.black,
                color: state.localeCode == 'ar'
                    ? AppColors.black
                    : AppColors.white,
                title: S.of(context).arabic,
                titleColor: state.localeCode == 'ar'
                    ? AppColors.white
                    : AppColors.black,
                onPressed: () {
                  BlocProvider.of<LocaleCubit>(context).changeLanguage(
                      languageCode: 'ar', isLocale: isLocale ?? true);
                }),
            CustomButton(
                borderColor: AppColors.black,
                color: state.localeCode == 'en'
                    ? AppColors.black
                    : AppColors.white,
                titleColor: state.localeCode == 'en'
                    ? AppColors.white
                    : AppColors.black,
                title: S.of(context).english,
                onPressed: () {
                  BlocProvider.of<LocaleCubit>(context).changeLanguage(
                      languageCode: 'en', isLocale: isLocale ?? true);
                }),
          ],
        );
      },
    );
  }
}

OutlineInputBorder buildErrorBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(4),
  );
}

TextStyle mainTFFTextStyle(context, {Color? color, bool isEnabled = true}) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: AppStrings.arabicFont,
          overflow: TextOverflow.ellipsis,
          color: color ?? AppColors.black,
          fontSize: 14,
        );

OutlineInputBorder buildMainBuild() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.black),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );
}
