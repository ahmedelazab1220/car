part of 'my_cars_cubit.dart';

sealed class MyCarsState extends Equatable {
  const MyCarsState();

  @override
  List<Object> get props => [];
}

final class MyCarsInitial extends MyCarsState {}

final class MyCarsLoading extends MyCarsState {}

final class MyCarsSuccess extends MyCarsState {
  final List<MyCarsEntity> data;
  const MyCarsSuccess({required this.data});
}

final class MyCarsFailure extends MyCarsState {
  final String errorMessage;
  const MyCarsFailure({required this.errorMessage});
}
