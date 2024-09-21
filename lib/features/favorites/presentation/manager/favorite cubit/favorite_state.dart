part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<ProviderEntity> data;

  const FavoriteSuccess({required this.data});
}

final class FavoriteFailure extends FavoriteState {
  final String errorMessage;

  FavoriteFailure({required this.errorMessage});
}
