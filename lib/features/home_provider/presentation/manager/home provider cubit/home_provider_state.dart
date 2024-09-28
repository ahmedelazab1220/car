part of 'home_provider_cubit.dart';

sealed class HomeProviderState extends Equatable {
  const HomeProviderState();

  @override
  List<Object> get props => [];
}

final class HomeProviderInitial extends HomeProviderState {}

final class HomeProviderLoading extends HomeProviderState {}

final class HomeProviderSuccess extends HomeProviderState {
  final HomeProviderEntity data;

  const HomeProviderSuccess({required this.data});
}

final class HomeProviderFailure extends HomeProviderState {
  final String errorMessage;

  const HomeProviderFailure({required this.errorMessage});
}
