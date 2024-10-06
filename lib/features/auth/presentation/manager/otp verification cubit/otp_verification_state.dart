part of 'otp_verification_cubit.dart';

abstract class OtpVerificationState {}

final class OtpVerificationInitial extends OtpVerificationState {}

final class OtpVerificationLoading extends OtpVerificationState {}

final class OtpVerificationSuccess extends OtpVerificationState {
  final UserEntity entity;

  OtpVerificationSuccess({required this.entity});
}

final class OtpVerificationFailure extends OtpVerificationState {
  final String errorMessage;

  OtpVerificationFailure({required this.errorMessage});
}
