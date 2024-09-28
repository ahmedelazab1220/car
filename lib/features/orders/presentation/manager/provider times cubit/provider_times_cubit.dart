import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';

part 'provider_times_state.dart';

class ProviderTimesCubit extends Cubit<ProviderTimesState> {
  final OrdersRepo ordersRepo;
  ProviderTimesCubit(
    this.ordersRepo,
  ) : super(ProviderTimesInitial());

  Future<void> getProviderTimes({int? providerId, String? orderDate}) async {
    emit(ProviderTimesLoading());
    var result = await ordersRepo.getProviderTimes(
        providerId: providerId, orderDate: orderDate);
    result.fold((failure) {
      emit(ProviderTimesFailure(errorMessage: failure.errMessage));
    }, (success) {
      emit(ProviderTimesSuccess(data: success));
    });
  }
}
