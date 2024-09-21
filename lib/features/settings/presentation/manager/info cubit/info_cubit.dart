import 'package:car_help/features/settings/data/repos/settings_repo_impl.dart';
import 'package:car_help/features/settings/domain/entites/info_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  final SettingsRepoImpl settingsRepoImpl;
  InfoCubit(
    this.settingsRepoImpl,
  ) : super(InfoInitial());

  Future<void> getPrivacyPolicy() async {
    emit(InfoLoading());
    var result = await settingsRepoImpl.getPrivacyPolicy();
    result.fold(
      (failure) => {
        emit(
          InfoFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          InfoSoccess(privacyPolicyData: success),
        ),
      },
    );
  }

  Future<void> getTermsAndConditions() async {
    emit(InfoLoading());
    var result = await settingsRepoImpl.getTermsAndConditions();
    result.fold(
      (failure) => {
        emit(
          InfoFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          InfoSoccess(termsAndConditionsData: success),
        ),
      },
    );
  }

  Future<void> getAboutUs() async {
    emit(InfoLoading());
    var result = await settingsRepoImpl.getAboutUs();
    result.fold(
      (failure) => {
        emit(
          InfoFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          InfoSoccess(aboutUsData: success),
        ),
      },
    );
  }
}
