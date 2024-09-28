import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/home_provider/domain/entities/home_provider_entity.dart';
import 'package:car_help/features/home_provider/domain/repos/home_provider_repo.dart';

part 'home_provider_state.dart';

class HomeProviderCubit extends Cubit<HomeProviderState> {
  final HomeProviderRepo homeProviderRepo;
  HomeProviderCubit(
    this.homeProviderRepo,
  ) : super(HomeProviderInitial());

  Future<void> getHomeProvider() async {
    emit(HomeProviderLoading());
    var result = await homeProviderRepo.getHomeProvider();
    result.fold(
      (failure) => {
        emit(
          HomeProviderFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          HomeProviderSuccess(data: success),
        ),
      },
    );
  }
}
