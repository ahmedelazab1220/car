part of 'services_cubit.dart';

abstract class ServicesState {}

final class ServicesInitial extends ServicesState {}

final class ServicesLoading extends ServicesState {}

final class ServicesSuccess extends ServicesState {
  final List<ServiceEntity> data;
  ServicesSuccess({required this.data});
}

final class ServicesFailure extends ServicesState {
  final String errorMessage;
  ServicesFailure({required this.errorMessage});
}
