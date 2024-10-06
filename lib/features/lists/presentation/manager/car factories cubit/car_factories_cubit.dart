import 'package:equatable/equatable.dart';

import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
