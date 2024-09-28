import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final OrdersRepo ordersRepo;
  AddOrderCubit(
    this.ordersRepo,
  ) : super(AddOrderInitial());

  Future<void> addOrder({
    String? orderType,
    int? providerId,
    String? orderDate,
    String? orderFromTime,
    String? orderToTime,
    String? paymentMethod,
  }) async {
    emit(AddOrderLoading());
    var result = await ordersRepo.addOrder(
        orderType: orderType,
        providerId: providerId,
        orderDate: orderDate,
        orderFromTime: orderFromTime,
        orderToTime: orderToTime,
        paymentMethod: paymentMethod);
    result.fold((failure) {
      emit(AddOrderFailure(errorMessage: failure.errMessage));
    }, (success) {
      emit(AddOrderSuccess(message: success));
    });
  }
}
