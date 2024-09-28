import 'dart:ui';

import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:car_help/core/utils/app_strings.dart';
import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final ProfileRepoImpl profileRepoImpl;
  LocaleCubit(
    this.profileRepoImpl,
  ) : super(LocaleState('en')) {
    _initialize();
  }

  Future<void> _initialize() async {
    final savedLanguage = await getSavedLanguage();
    emit(LocaleState(savedLanguage));
  }

  static Future<String> getSavedLanguage() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final cachedLangCode = sharedPreferences.getString(AppStrings.locale);
      return cachedLangCode ?? PlatformDispatcher.instance.locale.languageCode;
    } catch (e) {
      return PlatformDispatcher.instance.locale.languageCode;
    }
  }

  Future<void> changeLanguage(
      {String languageCode = 'ar', bool isLocale = true}) async {
    emit(ToggleLanguageLoading(languageCode));
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(AppStrings.locale, languageCode);
    if (isLocale) {
      emit(LocaleState(languageCode));
    } else {
      var result = await profileRepoImpl.toggleLanguage(language: languageCode);
      result.fold(
        (failure) => {
          emit(
            ToggleLanguageFailure(languageCode),
          ),
        },
        (success) => {emit(LocaleState(languageCode))},
      );
    }
  }
}
