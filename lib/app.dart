import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/helper/firebase_helper.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/helper/app_helper.dart';
import 'config/helper/locale_helper/locale_cubit/locale_cubit.dart';
import 'config/helper/locale_helper/locale_cubit/locale_state.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppHelper.providers,
      child: BlocConsumer<LocaleCubit, LocaleState>(
        listener: (context, state) {},
        builder: (context, state) {
          FirebaseHelper().init(context: context);
          return MaterialApp.router(
            theme: ThemeData(
              cardTheme: CardTheme(color: AppColors.white),
              appBarTheme: AppBarTheme(color: AppColors.white),
              dialogBackgroundColor: AppColors.white,
              colorScheme: ColorScheme.fromSeed(
                  primary: AppColors.primary,
                  seedColor: AppColors.white,
                  background: AppColors.white),
              fontFamily: AppStrings.arabicFont,
            ),
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            locale: Locale(state.localeCode),
            localizationsDelegates: AppHelper.locales,
            supportedLocales: S.delegate.supportedLocales,
            localeResolutionCallback: AppHelper.localeResolutionCallback,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
