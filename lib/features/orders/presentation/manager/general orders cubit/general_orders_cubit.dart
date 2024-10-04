import 'package:bloc/bloc.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';

part 'general_orders_state.dart';

class GeneralOrdersCubit extends Cubit<GeneralOrdersState> {
  final OrdersRepo ordersRepo;

  GeneralOrdersCubit(
    this.ordersRepo,
  ) : super(GeneralOrdersInitial());

  Future<void> getMyOrders({String? orderStatuse, String? orderType}) async {
    emit(GeneralOrdersLoading());
    var result = await ordersRepo.getMyOrders(orderType: AppStrings.public);
    result.fold((failure) {
      emit(GeneralOrdersFailure(errorMessage: failure.errMessage));
    }, (success) {
      emit(GeneralOrdersSuccess(
        pending: success
            .where((order) => order.orderStatus == AppStrings.pending)
            .toList(),
        inProgress: success
            .where((order) => order.orderStatus == AppStrings.inProgress)
            .toList(),
        completed: success
            .where((order) => order.orderStatus == AppStrings.completed)
            .toList(),
        canceled: success
            .where((order) => order.orderStatus == AppStrings.canceled)
            .toList(),
      ));
    });
  }
}
