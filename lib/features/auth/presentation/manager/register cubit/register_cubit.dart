import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepoImpl authRepoImpl;

  RegisterCubit(
    this.authRepoImpl,
  ) : super(RegisterInitial());

  Future<void> register({
    String? userType,
    String? name,
    String? phone,
    String? password,
    String? passwordConfirmation,
    String? address,
    String? commercialRegister,
    int? cityId,
    int? districtId,
    double? lat,
    double? lng,
    List<int>? categoryIds,
  }) async {
    emit(RegisterLoading());
    var result = await authRepoImpl.register(
      userType: userType,
      name: name,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
      address: address,
      commercialRegister: commercialRegister,
      cityId: cityId,
      districtId: districtId,
      lat: lat,
      lng: lng,
      categoryIds: categoryIds,
    );
    result.fold(
      (failure) => {
        emit(
          RegisterFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          RegisterSuccess(data: success),
        ),
      },
    );
  }
}
