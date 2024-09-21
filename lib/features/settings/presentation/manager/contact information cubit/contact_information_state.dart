part of 'contact_information_cubit.dart';

@immutable
sealed class ContactInformationState {}

final class ContactInformationInitial extends ContactInformationState {}

final class ContactInformationLoading extends ContactInformationState {}

final class ContactInformationSuccess extends ContactInformationState {
  final ContactInformationEntity data;
  ContactInformationSuccess({required this.data});
}

final class ContactInformationFailure extends ContactInformationState {
  final String errorMessage;
  ContactInformationFailure({required this.errorMessage});
}
