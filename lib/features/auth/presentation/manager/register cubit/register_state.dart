part of 'register_cubit.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final UserEntity data;
  RegisterSuccess({required this.data});
}

final class RegisterFailure extends RegisterState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}
