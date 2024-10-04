import 'package:bloc/bloc.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/my_services/domain/repos/my_service_repo.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';

part 'my_services_state.dart';

class MyServicesCubit extends Cubit<MyServicesState> {
  final MyServicesRepo myServicesRepo;
  MyServicesCubit(
    this.myServicesRepo,
  ) : super(MyServicesInitial());

  Future<void> getMyService({String? orderStatuse, String? orderType}) async {
    emit(MyServicesLoading());
    var result = await myServicesRepo.getMyService();
    result.fold((failure) {
      emit(MyServicesFailure(errorMessage: failure.errMessage));
    }, (success) {
      emit(MyServicesSuccess(
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
