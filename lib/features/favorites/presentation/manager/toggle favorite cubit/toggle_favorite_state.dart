part of 'toggle_favorite_cubit.dart';

sealed class ToggleFavoriteState extends Equatable {
  const ToggleFavoriteState();

  @override
  List<Object> get props => [];
}

final class ToggleFavoriteInitial extends ToggleFavoriteState {}

final class ToggleFavoriteLoading extends ToggleFavoriteState {}

final class ToggleFavoriteSuccess extends ToggleFavoriteState {
  final String message;
  const ToggleFavoriteSuccess({required this.message});
}

final class ToggleFavoriteFailure extends ToggleFavoriteState {
  final String errorMessage;
  const ToggleFavoriteFailure({required this.errorMessage});
}
