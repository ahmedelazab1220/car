import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';

part 'car_models_state.dart';

class CarModelsCubit extends Cubit<CarModelsState> {
  final ListsRepo listsRepo;
  CarModelsCubit(
    this.listsRepo,
  ) : super(CarModelsInitial());

  Future<void> getCarModels({String? type}) async {
    emit(CarModelsLoading());
    var result = await listsRepo.getCarModels();
    result.fold(
      (failure) => {
        emit(
          CarModelsFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          CarModelsSuccess(data: success),
        ),
      },
    );
  }
}
