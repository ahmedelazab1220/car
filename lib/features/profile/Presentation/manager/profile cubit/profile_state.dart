part of 'profile_cubit.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserEntity? data;

  ProfileSuccess({required this.data});
}

final class ProfileFailure extends ProfileState {
  final String errorMessage;

  ProfileFailure({required this.errorMessage});
}

final class ToggleNotificationSuccess extends ProfileState {
  final String? message;
  final int? enableNotification;
  final int? enableAdvertisement;

  ToggleNotificationSuccess(
      {this.enableNotification,
      this.enableAdvertisement,
      required this.message});
}

final class ToggleNotificationFailure extends ProfileState {
  final String errorMessage;

  ToggleNotificationFailure({required this.errorMessage});
}

final class UpdatePasswordFailure extends ProfileState {
  final String errorMessage;

  UpdatePasswordFailure({required this.errorMessage});
}
