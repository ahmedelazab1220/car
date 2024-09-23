part of 'car_models_cubit.dart';

sealed class CarModelsState extends Equatable {
  const CarModelsState();

  @override
  List<Object> get props => [];
}

final class CarModelsInitial extends CarModelsState {}

final class CarModelsLoading extends CarModelsState {}

final class CarModelsSuccess extends CarModelsState {
  final List<DropDownEntity> data;
  const CarModelsSuccess({required this.data});
}

final class CarModelsFailure extends CarModelsState {
  final String errorMessage;
  const CarModelsFailure({required this.errorMessage});
}
