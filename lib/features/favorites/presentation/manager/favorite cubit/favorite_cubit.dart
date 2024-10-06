import 'package:equatable/equatable.dart';

import 'package:car_help/features/favorites/domain/repos/favorite_repo.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;
  FavoriteCubit(
    this.favoriteRepo,
  ) : super(FavoriteInitial());

  Future<void> getFavorite() async {
    emit(FavoriteLoading());
    var result = await favoriteRepo.getFavorite();
    result.fold(
      (failure) => {
        emit(
          FavoriteFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          FavoriteSuccess(data: success),
        ),
      },
    );
  }
}
