import 'package:equatable/equatable.dart';

import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'provider_state.dart';

class ProviderCubit extends Cubit<ProviderState> {
  final HomeClientRepo homeClientRepo;
  ProviderCubit(
    this.homeClientRepo,
  ) : super(ProviderInitial());

  Future<void> getProvider({required int providerId}) async {
    emit(ProviderLoading());
    var result = await homeClientRepo.getProvider(providerId: providerId);
    result.fold(
      (failure) => emit(ProviderFailure(errorMessage: failure.errMessage)),
      (success) => emit(ProviderSuccess(data: success)),
    );
  }
}
