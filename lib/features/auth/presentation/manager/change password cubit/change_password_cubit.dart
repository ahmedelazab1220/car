import 'package:equatable/equatable.dart';

import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final AuthRepoImpl authRepoImpl;
  ChangePasswordCubit(
    this.authRepoImpl,
  ) : super(ChangePasswordInitial());

  Future changePassword(
      {String? oldPassword,
      String? newPassword,
      String? passwordConfirmation}) async {
    emit(ChangePasswordLoading());
    var result = await authRepoImpl.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        newPasswordConfirmation: passwordConfirmation);
    result.fold(
      (failure) => {
        emit(
          ChangePasswordFailed(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          ChangePasswordSuccess(message: success),
        ),
      },
    );
  }
}
