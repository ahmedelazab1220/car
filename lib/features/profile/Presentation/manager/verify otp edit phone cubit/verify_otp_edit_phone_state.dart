part of 'verify_otp_edit_phone_cubit.dart';

abstract class VerifyOtpEditPhoneState {}

final class VerifyOtpEditPhoneInitial extends VerifyOtpEditPhoneState {}

final class VerifyOtpEditPhoneLoading extends VerifyOtpEditPhoneState {}

final class VerifyOtpEditPhoneSuccess extends VerifyOtpEditPhoneState {
  final String message;

  VerifyOtpEditPhoneSuccess({required this.message});
}

final class VerifyOtpEditPhoneFailure extends VerifyOtpEditPhoneState {
  final String errorMessage;
  VerifyOtpEditPhoneFailure({required this.errorMessage});
}
