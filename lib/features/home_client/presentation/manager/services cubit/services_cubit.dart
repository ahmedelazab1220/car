import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final HomeClientRepo homeRepo;

  ServicesCubit(
    this.homeRepo,
  ) : super(ServicesInitial());

  Future<void> getServices({bool? remote}) async {
    emit(ServicesLoading());
    var result = await homeRepo.getServices(
      remote: remote ?? false,
    );
    result.fold(
      (failure) => {
        emit(
          ServicesFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          ServicesSuccess(data: success),
        ),
      },
    );
  }
}
