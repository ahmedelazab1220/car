import 'package:bloc/bloc.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';

part 'exhibits_orders_state.dart';

class ExhibitsOrdersCubit extends Cubit<ExhibitsOrdersState> {
  final OrdersRepo ordersRepo;

  ExhibitsOrdersCubit(
    this.ordersRepo,
  ) : super(ExhibitsOrdersInitial());

  Future<void> getMyOrders({String? orderStatuse, String? orderType}) async {
    emit(ExhibitsOrdersLoading());
    var result = await ordersRepo.getMyOrders(orderType: AppStrings.exhibited);
    result.fold((failure) {
      emit(ExhibitsOrdersFailure(errorMessage: failure.errMessage));
    }, (success) {
      emit(ExhibitsOrdersSuccess(
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
