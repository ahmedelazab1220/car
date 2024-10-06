import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepoImpl authRepoImpl;
  LoginCubit(
    this.authRepoImpl,
  ) : super(LoginInitial());
  Future<void> login({String? phone, String? password}) async {
    emit(LoginLoading());
    var result = await authRepoImpl.login(email: phone, password: password);
    result.fold(
      (failure) => {
        emit(
          LoginFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          LoginSuccess(data: success),
        ),
      },
    );
  }
}
