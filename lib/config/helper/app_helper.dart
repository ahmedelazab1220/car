import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_cubit.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/Notification/Presentation/manger/notifications%20cubit/notifications_cubit.dart';
import 'package:car_help/features/Notification/data/repos/notification_repo_impl.dart';
import 'package:car_help/features/addresses/domain/repos/addresses_repo.dart';
import 'package:car_help/features/addresses/presentation/manager/addresses%20cubit/addresses_cubit.dart';
import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:car_help/features/auth/presentation/manager/send%20otp%20cubit/send_otp_cubit.dart';
import 'package:car_help/features/exhibits/domain/repos/exhibits_repo.dart';
import 'package:car_help/features/exhibits/presentation/manager/exhibits%20cubit/exhibits_cubit.dart';
import 'package:car_help/features/favorites/domain/repos/favorite_repo.dart';
import 'package:car_help/features/favorites/presentation/manager/toggle%20favorite%20cubit/toggle_favorite_cubit.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:car_help/features/home_client/presentation/manager/home%20client%20cubit/home_client_cubit.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:car_help/features/lists/presentation/manager/districts%20cubit/districts_cubit.dart';
import 'package:car_help/features/my_cars/doman/repos/mycars_repo.dart';
import 'package:car_help/features/my_cars/presentation/manager/mycars%20cubit/my_cars_cubit.dart';
import 'package:car_help/features/profile/Presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:car_help/features/settings/data/repos/settings_repo_impl.dart';
import 'package:car_help/features/settings/presentation/manager/info%20cubit/info_cubit.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nested/nested.dart';

class AppHelper {
  static List<SingleChildWidget> providers = [
    BlocProvider(
        create: (context) => LocaleCubit(getIt.get<ProfileRepoImpl>())),

    BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<AuthRepoImpl>(),
      ),
    ),
    BlocProvider(
      create: (context) => SendOtpCubit(
        getIt.get<AuthRepoImpl>(),
      ),
    ),
    BlocProvider(
      create: (context) => ToggleFavoriteCubit(getIt.get<FavoriteRepo>()),
    ),
    BlocProvider(
      create: (context) => AddressesCubit(
        getIt.get<AddressesRepo>(),
      ),
    ),
    BlocProvider(
      create: (context) => MyCarsCubit(getIt.get<MyCarsRepo>()),
    ),
    BlocProvider(
      create: (context) => DistrictsCubit(getIt.get<ListsRepo>()),
    ),
    BlocProvider(
      create: (context) => ExhibitsCubit(getIt.get<ExhibitsRepo>()),
    ),
    // BlocProvider(
    //   create: (context) => HomeProviderDataCubit(
    //     getIt.get<HomeRepoImpl>(),
    //   ),
    // ),
    BlocProvider(
      create: (context) => ProfileCubit(
        getIt.get<ProfileRepoImpl>(),
      ),
    ),
    BlocProvider(
      create: (context) => NotificationsCubit(
        getIt.get<NotificationRepoImpl>(),
      ),
    ),
    BlocProvider(
      create: (context) => HomeClientCubit(
        getIt.get<HomeClientRepo>(),
      ),
    ),
    BlocProvider(
      create: (context) => InfoCubit(
        getIt.get<SettingsRepoImpl>(),
      ),
    ),
  ];

  static Iterable<LocalizationsDelegate<dynamic>> locales = [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static Iterable<Locale> supportedLocales = [
    const Locale(AppStrings.englishCode),
    const Locale(AppStrings.arabicCode),
  ];

  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale> supportLang) {
    for (var supportedLan in supportLang) {
      if (supportedLan.languageCode == locale!.languageCode &&
          supportedLan.countryCode == locale.countryCode) {
        return supportedLan;
      }
    }
    return supportLang.first;
  }
}
