import 'package:bloc/bloc.dart';
import 'package:car_help/features/my_cars/doman/entities/mycars_entity.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/my_cars/doman/repos/mycars_repo.dart';

part 'my_cars_state.dart';

class MyCarsCubit extends Cubit<MyCarsState> {
  final MyCarsRepo myCarsRepo;
  List<MyCarsEntity> myCarsList = [];
  MyCarsCubit(
    this.myCarsRepo,
  ) : super(MyCarsInitial());

  Future<void> getMyCars() async {
    emit(MyCarsLoading());
    var result = await myCarsRepo.getMyCars();
    result.fold(
      (failure) => {
        emit(
          MyCarsFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        myCarsList = success,
        emit(
          MyCarsSuccess(data: myCarsList),
        ),
      },
    );
  }

  Future<void> addMyCar(
      {int? carFactoryId, int? carModelId, String? manufactureYear}) async {
    emit(MyCarsLoading());
    var result = await myCarsRepo.addMyCar(
        carFactoryId: carFactoryId,
        carModelId: carModelId,
        manufactureYear: manufactureYear);
    result.fold(
      (failure) => {
        emit(
          MyCarsFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        getMyCars(),
        emit(
          MyCarsSuccess(data: myCarsList),
        ),
      },
    );
  }

  Future<void> updateMyCar({required MyCarsEntity car}) async {
    emit(MyCarsLoading());
    final result = await myCarsRepo.updateMyCar(
        carFactoryId: car.carFactory?.id ?? 0,
        carModelId: car.carModel?.id ?? 0,
        manufactureYear: car.manufactureYear);
    result.fold(
      (failure) => emit(MyCarsFailure(errorMessage: failure.errMessage)),
      (success) {
        final index = myCarsList.indexWhere((element) => element.id == car.id);
        if (index != -1) {
          myCarsList[index] = car;
        }
        emit(MyCarsSuccess(data: myCarsList));
      },
    );
  }

  Future<void> deleteMyCar({int? id}) async {
    emit(MyCarsLoading());
    var result = await myCarsRepo.deleteMyCar(id: id);
    result.fold(
      (failure) => {
        emit(
          MyCarsFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        myCarsList.removeWhere((element) => element.id == id),
        emit(
          MyCarsSuccess(data: myCarsList),
        ),
      },
    );
  }
}
