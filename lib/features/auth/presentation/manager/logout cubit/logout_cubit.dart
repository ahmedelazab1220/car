import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepoImpl authRepoImpl;
  LogoutCubit(
    this.authRepoImpl,
  ) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    var user = await authRepoImpl.logout();
    user.fold(
      (failure) => {
        emit(
          LogoutFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          LogoutSuccess(message: success),
        ),
      },
    );
  }
}
