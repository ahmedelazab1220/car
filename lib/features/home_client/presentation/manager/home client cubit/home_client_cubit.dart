import 'package:car_help/features/home_client/data/repos/home_client_repo_impl.dart';
import 'package:car_help/features/home_client/domain/entities/banner_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_client_state.dart';

class HomeClientCubit extends Cubit<HomeClientState> {
  final HomeClientRepo homeRepo;

  HomeClientCubit(
    this.homeRepo,
  ) : super(HomeClientInitial());

  Future<void> getHome() async {
    emit(HomeClientLoading());
    var result = await homeRepo.getHome();
    result.fold(
      (failure) => {
        emit(
          HomeClientFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          HomeClientSuccess(
            providers: success.providers,
            banners: success.banners,
          ),
        ),
      },
    );
  }
}
