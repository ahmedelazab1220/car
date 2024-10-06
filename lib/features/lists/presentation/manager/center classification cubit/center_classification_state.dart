part of 'center_classification_cubit.dart';

abstract class CenterClassificationState {}

final class CenterClassificationInitial extends CenterClassificationState {}

final class CenterClassificationLoading extends CenterClassificationState {}

final class CenterClassificationSuccess extends CenterClassificationState {
  final List<ServiceEntity> data;

  CenterClassificationSuccess({required this.data});
}

final class CenterClassificationFailure extends CenterClassificationState {
  final String errorMessage;

  CenterClassificationFailure({required this.errorMessage});
}
