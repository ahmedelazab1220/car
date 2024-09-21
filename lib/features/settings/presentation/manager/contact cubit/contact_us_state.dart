part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}

final class ContactUsLoading extends ContactUsState {}

final class ContactUsFailure extends ContactUsState {
  final String errorMessage;

  ContactUsFailure({required this.errorMessage});
}

final class ContactUsSuccess extends ContactUsState {
  final String message;

  ContactUsSuccess({required this.message});
}
