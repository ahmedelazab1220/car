part of 'special_orders_cubit.dart';

sealed class SpecialOrdersState extends Equatable {
  const SpecialOrdersState();

  @override
  List<Object> get props => [];
}

final class ExhibitsOrdersInitial extends SpecialOrdersState {}

final class SpecialOrdersLoading extends SpecialOrdersState {}

final class SpecialOrdersSuccess extends SpecialOrdersState {
   final List<OrderEntity> pending;
  final List<OrderEntity> inProgress;
  final List<OrderEntity> completed;
  final List<OrderEntity> canceled;

  const SpecialOrdersSuccess(
      {required this.inProgress,
      required this.completed,
      required this.canceled,
      required this.pending});
}

final class SpecialOrdersFailure extends SpecialOrdersState {
  final String errorMessage;

  const SpecialOrdersFailure({required this.errorMessage});
}
