part of 'exhibits_orders_cubit.dart';

sealed class ExhibitsOrdersState extends Equatable {
  const ExhibitsOrdersState();

  @override
  List<Object> get props => [];
}

final class ExhibitsOrdersInitial extends ExhibitsOrdersState {}

final class ExhibitsOrdersLoading extends ExhibitsOrdersState {}

final class ExhibitsOrdersSuccess extends ExhibitsOrdersState {
  final List<OrderEntity> pending;
  final List<OrderEntity> inProgress;
  final List<OrderEntity> completed;
  final List<OrderEntity> canceled;

  const ExhibitsOrdersSuccess(
      {required this.inProgress,
      required this.completed,
      required this.canceled,
      required this.pending});
}

final class ExhibitsOrdersFailure extends ExhibitsOrdersState {
  final String errorMessage;

  const ExhibitsOrdersFailure({required this.errorMessage});
}
