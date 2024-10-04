import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrdersRepo ordersRepo;
  OrderDetailsCubit(
    this.ordersRepo,
  ) : super(OrderDetailsInitial());

  Future<void> cancelOrder({int? orderId, String? reason}) async {
    emit(OrderDetailsLoading());
    var result = await ordersRepo.cancelOrder(orderId: orderId, reason: reason);
    result.fold((failure) {
      emit(OrderDetailsFailure(errorMessage: failure.errMessage));
    }, (success) {
      emit(OrderDetailsSuccess(message: success));
    });
  }
}
