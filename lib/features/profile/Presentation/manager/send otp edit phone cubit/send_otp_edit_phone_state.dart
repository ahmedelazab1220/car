part of 'send_otp_edit_phone_cubit.dart';

abstract class SendOtpEditPhoneState {}

final class SendOtpEditPhoneInitial extends SendOtpEditPhoneState {}

final class SendOtpEditPhoneLoading extends SendOtpEditPhoneState {}

final class SendOtpEditPhoneSuccess extends SendOtpEditPhoneState {
  final String? phone;

  SendOtpEditPhoneSuccess({required this.phone});
}

final class SendOtpEditPhoneFailure extends SendOtpEditPhoneState {
  final String errorMessage;

  SendOtpEditPhoneFailure({required this.errorMessage});
}
