import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepoImpl profileRepoImpl;
  UserEntity? userEntity;
  ProfileCubit(
    this.profileRepoImpl,
  ) : super(ProfileInitial());

  Future<void> getProfileData({bool remote = false}) async {
    emit(ProfileLoading());
    var result = await profileRepoImpl.getProfileData(remote: remote);
    result.fold(
      (failure) => {
        emit(
          ProfileFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        userEntity = success,
        emit(
          ProfileSuccess(data: success),
        ),
      },
    );
  }

  // Future<void> updatePassword({
  //   String? oldPassword,
  //   String? newPassword,
  //   String? confirmPassword,
  // }) async {
  //   emit(ProfileLoading());
  //   var result = await profileRepoImpl.updatePassword(
  //     oldPassword: oldPassword,
  //     newPassword: newPassword,
  //     confirmPassword: confirmPassword,
  //   );
  //   result.fold(
  //     (failure) => {
  //       emit(
  //         UpdatePasswordFailure(errorMessage: failure.errMessage),
  //       ),
  //     },
  //     (success) => {
  //       emit(
  //         ProfileSuccess(data: success),
  //       ),
  //     },
  //   );
  // }

  Future<void> toggleNotification(
      {int? enableNotification, int? enableAdvertisement}) async {
    var result = await profileRepoImpl.toggleNotification(
      enableNotification: enableNotification,
      enableAdvertisement: enableAdvertisement,
    );
    result.fold(
      (failure) => {
        emit(
          ToggleNotificationFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        if (enableNotification != null)
          {
            userEntity?.enableNotification = enableNotification,
          },
        if (enableAdvertisement != null)
          {
            userEntity?.enableAdvertisementNotification = enableAdvertisement,
          },
        emit(
          ProfileSuccess(data: userEntity),
        ),
      },
    );
  }
}
