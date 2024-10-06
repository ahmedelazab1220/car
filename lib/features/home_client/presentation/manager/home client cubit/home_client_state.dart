part of 'home_client_cubit.dart';

abstract class HomeClientState {}

final class HomeClientInitial extends HomeClientState {}

final class HomeClientLoading extends HomeClientState {}

final class HomeClientSuccess extends HomeClientState {
  final List<BannerEntity>? banners;
  final List<ProviderEntity>? providers;
  HomeClientSuccess({required this.providers, required this.banners});
}

final class HomeClientFailure extends HomeClientState {
  final String errorMessage;

  HomeClientFailure({required this.errorMessage});
}
