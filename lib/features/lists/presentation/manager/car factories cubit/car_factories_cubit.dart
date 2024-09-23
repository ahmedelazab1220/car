import 'package:bloc/bloc.dart';
import 'package:car_help/features/lists/presentation/manager/car%20models%20cubit/car_models_cubit.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';

part 'car_factories_state.dart';

class CarFactoriesCubit extends Cubit<CarFactoriesState> {
  final ListsRepo listsRepo;
  CarFactoriesCubit(
    this.listsRepo,
  ) : super(CarFactoriesInitial());

  Future<void> getCarFactories({String? type}) async {
    emit(CarFactoriesLoading());
    var result = await listsRepo.getCarFactories();
    result.fold(
      (failure) => {
        emit(
          CarFactoriesFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          CarFactoriesSuccess(data: success),
        ),
      },
    );
  }
}
