part of 'addresses_cubit.dart';

sealed class AddressesState extends Equatable {
  const AddressesState();

  @override
  List<Object> get props => [];
}

final class AddressesInitial extends AddressesState {}

final class AddressesLoading extends AddressesState {}

final class AddressesFailure extends AddressesState {
  final String errorMessage;

  const AddressesFailure({required this.errorMessage});
}

final class AddressesSuccess extends AddressesState {
  final List<AddressEntity> data;
  const AddressesSuccess({required this.data});
}
