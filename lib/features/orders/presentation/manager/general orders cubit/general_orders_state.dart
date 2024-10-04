part of 'general_orders_cubit.dart';

sealed class GeneralOrdersState extends Equatable {
  const GeneralOrdersState();

  @override
  List<Object> get props => [];
}

final class GeneralOrdersInitial extends GeneralOrdersState {}

final class GeneralOrdersLoading extends GeneralOrdersState {}

final class GeneralOrdersSuccess extends GeneralOrdersState {
  final List<OrderEntity> pending;
  final List<OrderEntity> inProgress;
  final List<OrderEntity> completed;
  final List<OrderEntity> canceled;

  const GeneralOrdersSuccess(
      {required this.inProgress,
      required this.completed,
      required this.canceled,
      required this.pending});
}

final class GeneralOrdersFailure extends GeneralOrdersState {
  final String errorMessage;

  const GeneralOrdersFailure({required this.errorMessage});
}
