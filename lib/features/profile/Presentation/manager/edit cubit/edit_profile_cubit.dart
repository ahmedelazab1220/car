import 'dart:io';
import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final ProfileRepoImpl profileRepoImpl;
  EditProfileCubit(
    this.profileRepoImpl,
  ) : super(EditProfileInitial());
  Future<void> editProfileData(
      {String? name,
      String? phone,
      String? address,
      String? commercialRegister,
      int? cityId,
      int? districtId,
      double? lat,
      double? lng,
      List<int>? categoryIds,
      List<File>? works}) async {
    emit(EditProfileLoading());
    var result = await profileRepoImpl.editProfileData(
        name: name,
        phone: phone,
        address: address,
        commercialRegister: commercialRegister,
        cityId: cityId,
        districtId: districtId,
        lat: lat,
        lng: lng,
        categoryIds: categoryIds,
        works: works);
    result.fold(
      (failure) => {
        emit(
          EditProfileFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          EditProfileSuccess(message: success),
        ),
      },
    );
  }

  Future<void> deleteAccount() async {
    emit(EditProfileLoading());
    var result = await profileRepoImpl.deleteAccount();
    result.fold(
      (failure) => {
        emit(
          EditProfileFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          DeleteAccountSuccess(),
        ),
      },
    );
  }
}
