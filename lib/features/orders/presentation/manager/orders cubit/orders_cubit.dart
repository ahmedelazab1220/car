import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit(
    this.ordersRepo,
  ) : super(OrdersInitial());

  Future<void> getMyOrders({String? orderStatuse, String? orderType}) async {
    emit(OrdersLoading());
    var result = await ordersRepo.getMyOrders(
        orderStatuse: orderStatuse, orderType: orderType);
    result.fold((failure) {
      emit(OrdersFailure(errorMessage: failure.errMessage));
    }, (success) {
      emit(OrdersSuccess(data: success));
    });
  }
}
