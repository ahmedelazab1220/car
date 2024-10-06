part of 'districts_cubit.dart';

abstract class DistrictsState {}

final class DistrictsInitial extends DistrictsState {}

final class DistrictsLoading extends DistrictsState {}

final class DistrictsSuccess extends DistrictsState {
  final List<DropDownEntity> data;

  DistrictsSuccess({required this.data});
}

final class DistrictsFailure extends DistrictsState {
  final String errorMessage;

  DistrictsFailure({required this.errorMessage});
}
