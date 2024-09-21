part of 'update_register_data_cubit.dart';

sealed class UpdateRegisterDataState {}

final class UpdateRegisterDataInitial extends UpdateRegisterDataState {}

final class UpdateRegisterDataLoading extends UpdateRegisterDataState {}

final class UpdateRegisterDataSuccess extends UpdateRegisterDataState {
  final List? list;
  UpdateRegisterDataSuccess({required this.list});
}

final class UpdateRegisterDataFailure extends UpdateRegisterDataState {
  final String errorMessage;
  UpdateRegisterDataFailure({required this.errorMessage});
}
