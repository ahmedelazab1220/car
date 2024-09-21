import 'package:bloc/bloc.dart';
import 'package:car_help/features/settings/data/repos/settings_repo_impl.dart';
import 'package:meta/meta.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final SettingsRepoImpl settingsRepoImpl;
  ContactUsCubit(
    this.settingsRepoImpl,
  ) : super(ContactUsInitial());

  Future<void> posrContactUs({
    String? name,
    String? phone,
    String? address,
    String? message,
  }) async {
    emit(ContactUsLoading());
    var result = await settingsRepoImpl.posrContactUs(
      name: name,
      phone: phone,
      address: address,
      message: message,
    );
    result.fold(
      (failure) => {
        emit(
          ContactUsFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          ContactUsSuccess(message: success),
        ),
      },
    );
  }
}
