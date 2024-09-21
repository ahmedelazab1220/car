import 'package:car_help/features/settings/data/repos/settings_repo_impl.dart';
import 'package:car_help/features/settings/domain/entites/contact_information_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'contact_information_state.dart';

class ContactInformationCubit extends Cubit<ContactInformationState> {
  final SettingsRepoImpl settingsRepoImpl;

  ContactInformationCubit(this.settingsRepoImpl)
      : super(ContactInformationInitial());

  Future<void> getContactInformation() async {
    emit(ContactInformationLoading());
    var result = await settingsRepoImpl.getContactInformation();
    result.fold(
      (failure) => {
        emit(
          ContactInformationFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          ContactInformationSuccess(data: success),
        ),
      },
    );
  }
}
