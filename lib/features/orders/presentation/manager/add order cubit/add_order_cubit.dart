import 'dart:io';

import 'package:equatable/equatable.dart';

import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    List<File>? orderFiles,
    int? categoryId,
    int? addressId,
    int? carId,
  }) async {
    emit(AddOrderLoading());
    var result = await ordersRepo.addOrder(
      orderType: orderType,
      providerId: providerId,
      orderDate: orderDate,
      orderFromTime: orderFromTime,
      orderToTime: orderToTime,
      paymentMethod: paymentMethod,
      orderFiles: orderFiles,
      categoryId: categoryId,
      addressId: addressId,
      carId: carId,
    );
    result.fold((failure) {
      emit(AddOrderFailure(errorMessage: failure.errMessage));
    }, (success) {
      emit(AddOrderSuccess(message: success));
    });
  }
}
