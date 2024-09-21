import 'package:car_help/features/home_client/data/repos/home_repo_impl.dart';
import 'package:car_help/features/home_client/domain/entities/banner_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(
    this.homeRepo,
  ) : super(HomeInitial());

  Future<void> getHome() async {
    emit(HomeLoading());
    var result = await homeRepo.getHome();
    result.fold(
      (failure) => {
        emit(
          HomeFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          HomeSuccess(
            providers: success.providers,
            banners: success.banners,
          ),
        ),
      },
    );
  }
}
