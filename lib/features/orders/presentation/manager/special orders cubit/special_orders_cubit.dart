import 'package:car_help/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'special_orders_state.dart';

class SpecialOrdersCubit extends Cubit<SpecialOrdersState> {
  final OrdersRepo ordersRepo;

  SpecialOrdersCubit(
    this.ordersRepo,
  ) : super(ExhibitsOrdersInitial());

  Future<void> getMyOrders({String? orderStatuse, String? orderType}) async {
    emit(SpecialOrdersLoading());
    var result = await ordersRepo.getMyOrders(orderType: AppStrings.private);
    result.fold((failure) {
      emit(SpecialOrdersFailure(errorMessage: failure.errMessage));
    }, (success) {
      emit(SpecialOrdersSuccess(
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
