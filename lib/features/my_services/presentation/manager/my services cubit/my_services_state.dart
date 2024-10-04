part of 'my_services_cubit.dart';

sealed class MyServicesState extends Equatable {
  const MyServicesState();

  @override
  List<Object> get props => [];
}

final class MyServicesInitial extends MyServicesState {}

final class MyServicesLoading extends MyServicesState {}

final class MyServicesSuccess extends MyServicesState {
  final List<OrderEntity> pending;
  final List<OrderEntity> inProgress;
  final List<OrderEntity> completed;
  final List<OrderEntity> canceled;

  const MyServicesSuccess(
      {required this.inProgress,
      required this.completed,
      required this.canceled,
      required this.pending});
}

final class MyServicesFailure extends MyServicesState {
  final String errorMessage;

  const MyServicesFailure({required this.errorMessage});
}
