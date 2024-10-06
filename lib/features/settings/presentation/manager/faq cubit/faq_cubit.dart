import 'package:car_help/features/settings/data/repos/settings_repo_impl.dart';
import 'package:car_help/features/settings/domain/entites/faq_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  final SettingsRepoImpl settingsRepoImpl;

  FaqCubit(
    this.settingsRepoImpl,
  ) : super(FaqInitial());

  Future<void> getFAQ() async {
    emit(FaqLoading());
    var result = await settingsRepoImpl.getFAQ();
    result.fold(
      (failure) => {
        emit(
          FaqFAilure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          FaqSuccess(data: success),
        ),
      },
    );
  }
}
