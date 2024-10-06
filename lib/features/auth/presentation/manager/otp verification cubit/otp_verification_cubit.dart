import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  final AuthRepoImpl authRepoImpl;

  OtpVerificationCubit(
    this.authRepoImpl,
  ) : super(OtpVerificationInitial());

  Future<void> otpVerification({String? phone, String? otpCode}) async {
    emit(OtpVerificationLoading());
    var result =
        await authRepoImpl.otpVerification(phone: phone, otpCode: otpCode);
    result.fold(
      (failure) => {
        emit(
          OtpVerificationFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          OtpVerificationSuccess(entity: success),
        ),
      },
    );
  }
}
