import 'package:bloc/bloc.dart';
import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:meta/meta.dart';

part 'verify_otp_edit_phone_state.dart';

class VerifyOtpEditPhoneCubit extends Cubit<VerifyOtpEditPhoneState> {
  final ProfileRepoImpl profileRepoImpl;
  VerifyOtpEditPhoneCubit(
    this.profileRepoImpl,
  ) : super(VerifyOtpEditPhoneInitial());

  Future<void> verifyOtpEditPhone({String? phone, String? otpCode}) async {
    emit(VerifyOtpEditPhoneLoading());
    var result = await profileRepoImpl.verifyOtpEditPhone(
        phone: phone, otpCode: otpCode);
    result.fold(
      (failure) => {
        emit(
          VerifyOtpEditPhoneFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          VerifyOtpEditPhoneSuccess(message: success),
        ),
      },
    );
  }
}
