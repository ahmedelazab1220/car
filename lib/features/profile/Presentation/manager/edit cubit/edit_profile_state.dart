part of 'edit_profile_cubit.dart';

abstract class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {
  final String message;

  EditProfileSuccess({required this.message});
}

final class DeleteAccountSuccess extends EditProfileState {}

final class EditProfileFailure extends EditProfileState {
  final String errorMessage;

  EditProfileFailure({required this.errorMessage});
}
