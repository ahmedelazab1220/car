import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_register_data_state.dart';

class UpdateRegisterDataCubit extends Cubit<UpdateRegisterDataState> {
  final AuthRepoImpl authRepoImpl;
  UpdateRegisterDataCubit(
    this.authRepoImpl,
  ) : super(UpdateRegisterDataInitial());

  Future<void> updateRegisterData({
    String? phone,
    int? userId,
  }) async {
    emit(UpdateRegisterDataLoading());
    var result = await authRepoImpl.editPhoneNumber(
      phone: phone,
      userId: userId,
    );
    result.fold(
      (failure) => {
        emit(
          UpdateRegisterDataFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          UpdateRegisterDataSuccess(list: [
            phone,
          ]),
        ),
      },
    );
  }
}
