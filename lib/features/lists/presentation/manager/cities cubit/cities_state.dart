part of 'cities_cubit.dart';

abstract class CitiesState {}

final class CitiesInitial extends CitiesState {}

final class CitiesLoading extends CitiesState {}

final class CitiesSuccess extends CitiesState {
  final List<DropDownEntity> data;

  CitiesSuccess({required this.data});
}

final class CitiesFailure extends CitiesState {
  final String errorMessage;

  CitiesFailure({required this.errorMessage});
}
