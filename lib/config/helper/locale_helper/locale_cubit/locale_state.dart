class LocaleState {
  final String localeCode;
  LocaleState(
    this.localeCode,
  );
}

final class ToggleLanguageLoading extends LocaleState {
  ToggleLanguageLoading(super.localeCode);
}

final class ToggleLanguageSuccess extends LocaleState {
  ToggleLanguageSuccess(super.localeCode);
}

final class ToggleLanguageFailure extends LocaleState {
  ToggleLanguageFailure(super.localeCode);
}
