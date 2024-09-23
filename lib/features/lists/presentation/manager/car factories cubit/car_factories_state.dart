part of 'car_factories_cubit.dart';

sealed class CarFactoriesState extends Equatable {
  const CarFactoriesState();

  @override
  List<Object> get props => [];
}

final class CarFactoriesInitial extends CarFactoriesState {}

final class CarFactoriesLoading extends CarFactoriesState {}

final class CarFactoriesSuccess extends CarFactoriesState {
  final List<DropDownEntity> data;

  const CarFactoriesSuccess({required this.data});
}

final class CarFactoriesFailure extends CarFactoriesState {
  final String errorMessage;

  const CarFactoriesFailure({required this.errorMessage});
}
