import 'package:bloc/bloc.dart';
import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:meta/meta.dart';

part 'send_otp_edit_phone_state.dart';

class SendOtpEditPhoneCubit extends Cubit<SendOtpEditPhoneState> {
  final ProfileRepoImpl profileRepoImpl;
  SendOtpEditPhoneCubit(
    this.profileRepoImpl,
  ) : super(SendOtpEditPhoneInitial());

  Future<void> sendOtpEditPhone({
    String? phone,
  }) async {
    emit(SendOtpEditPhoneLoading());
    var result = await profileRepoImpl.sendOtpEditPhone(
      phone: phone,
    );
    result.fold(
      (failure) => {
        emit(
          SendOtpEditPhoneFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          SendOtpEditPhoneSuccess(phone: phone),
        ),
      },
    );
  }
}
