import 'dart:io';
import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final ProfileRepoImpl profileRepoImpl;
  EditProfileCubit(
    this.profileRepoImpl,
  ) : super(EditProfileInitial());
  Future<void> editProfileData({
    String? name,
    String? email,
    File? profileImage,
    File? cv,
    List<File>? works,
    List<int>? categoryId,
    String? phone,
    String? accountType,
    String? experienceYears,
    String? url,
    String? about,
    List<int>? programs,
  }) async {
    emit(EditProfileLoading());
    var result = await profileRepoImpl.editProfileData(
      name: name,
      email: email,
      profileImage: profileImage,
      cv: cv,
      works: works,
      categoryId: categoryId,
      phone: phone,
      accountType: accountType,
      experienceYears: experienceYears,
      url: url,
      about: about,
      programs: programs,
    );
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
