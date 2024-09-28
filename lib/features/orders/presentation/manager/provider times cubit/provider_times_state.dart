part of 'provider_times_cubit.dart';

sealed class ProviderTimesState extends Equatable {
  const ProviderTimesState();

  @override
  List<Object> get props => [];
}

final class ProviderTimesInitial extends ProviderTimesState {}

final class ProviderTimesLoading extends ProviderTimesState {}

final class ProviderTimesSuccess extends ProviderTimesState {
  final List<ProviderTimesEntity> data;

  const ProviderTimesSuccess({required this.data});
}

final class ProviderTimesFailure extends ProviderTimesState {
  final String errorMessage;

  const ProviderTimesFailure({required this.errorMessage});
}
