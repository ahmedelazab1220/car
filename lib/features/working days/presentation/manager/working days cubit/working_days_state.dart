part of 'working_days_cubit.dart';

sealed class WorkingDaysState extends Equatable {
  const WorkingDaysState();

  @override
  List<Object> get props => [];
}

final class WorkingDaysInitial extends WorkingDaysState {}

final class WorkingDaysLoading extends WorkingDaysState {}

final class WorkingDaysSuccess extends WorkingDaysState {
  final List<ProviderTimesEntity> data;

  const WorkingDaysSuccess({required this.data});
}

final class WorkingDaysFailure extends WorkingDaysState {
  final String errorMessage;

  const WorkingDaysFailure({required this.errorMessage});
}
