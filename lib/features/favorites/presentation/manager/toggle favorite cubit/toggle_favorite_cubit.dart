import 'package:car_help/features/favorites/domain/repos/favorite_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_favorite_state.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  final FavoriteRepo favoriteRepo;
  ToggleFavoriteCubit(
    this.favoriteRepo,
  ) : super(ToggleFavoriteInitial());

  Future<void> toggleFavorite({int? id}) async {
    emit(ToggleFavoriteLoading());
    var result = await favoriteRepo.toggleFavorite(id: id);
    result.fold(
      (failure) => {
        emit(
          ToggleFavoriteFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          ToggleFavoriteSuccess(message: success),
        ),
      },
    );
  }
}
