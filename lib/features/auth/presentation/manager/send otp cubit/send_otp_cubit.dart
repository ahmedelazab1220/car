import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  final AuthRepoImpl authRepoImpl;

  SendOtpCubit(
    this.authRepoImpl,
  ) : super(SendOtpInitial());

  Future<void> sendOtpCode({
    String? phone,
  }) async {
    emit(SendOtpLoading());
    var result = await authRepoImpl.sendOtpCode(
      phone: phone,
    );
    result.fold(
      (failure) => {
        emit(
          SendOtpFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          SendOtpSuccess(phone: phone, message: success),
        ),
      },
    );
  }
}
