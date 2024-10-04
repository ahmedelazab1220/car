part of 'provider_cubit.dart';

sealed class ProviderState extends Equatable {
  const ProviderState();

  @override
  List<Object> get props => [];
}

final class ProviderInitial extends ProviderState {}

final class ProviderLoading extends ProviderState {}

final class ProviderSuccess extends ProviderState {
  final ProviderEntity data;

  const ProviderSuccess({required this.data});
}

final class ProviderFailure extends ProviderState {
  final String errorMessage;

  const ProviderFailure({required this.errorMessage});
}
