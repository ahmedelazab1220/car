part of 'info_cubit.dart';

abstract class InfoState {}

final class InfoInitial extends InfoState {}

final class InfoLoading extends InfoState {}

final class InfoSoccess extends InfoState {
  final InfoEntity? privacyPolicyData;
  final InfoEntity? termsAndConditionsData;
  final InfoEntity? aboutUsData;

  InfoSoccess(
      {this.termsAndConditionsData, this.aboutUsData, this.privacyPolicyData});
}

final class InfoFailure extends InfoState {
  final String errorMessage;

  InfoFailure({required this.errorMessage});
}
