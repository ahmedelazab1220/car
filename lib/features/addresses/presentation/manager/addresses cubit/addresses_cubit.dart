import 'package:equatable/equatable.dart';

import 'package:car_help/features/addresses/domain/entities/address_entity.dart';
import 'package:car_help/features/addresses/domain/repos/addresses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  final AddressesRepo addressesRepo;

  List<AddressEntity> addresses = [];
  AddressesCubit(
    this.addressesRepo,
  ) : super(AddressesInitial());

  Future<void> getAddresses({bool remote = true}) async {
    emit(AddressesLoading());
    var result = await addressesRepo.getAddresses(remote: remote);
    result.fold(
      (failure) => {
        emit(
          AddressesFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        addresses = success,
        emit(
          AddressesSuccess(data: addresses),
        ),
      },
    );
  }

  Future<void> addAddress({required AddressEntity address}) async {
    emit(AddressesLoading());
    var result = await addressesRepo.addAddress(address);
    result.fold(
      (failure) => {
        emit(
          AddressesFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        for (var address in addresses) {address.isDefault = 0},
        addresses.insert(0, address),
        emit(
          AddressesSuccess(data: addresses),
        ),
      },
    );
  }

  Future<void> updateAddress(AddressEntity address) async {
    emit(AddressesLoading());
    final result = await addressesRepo.updateAddress(address);
    result.fold(
      (failure) => emit(AddressesFailure(errorMessage: failure.errMessage)),
      (success) {
        for (var address in addresses) {
          address.isDefault = 0;
        }
        final index =
            addresses.indexWhere((element) => element.id == address.id);
        if (index != -1) {
          addresses[index] = address;
        }
        emit(AddressesSuccess(data: addresses));
      },
    );
  }

  Future<void> deleteAddress({int? id}) async {
    emit(AddressesLoading());
    var result = await addressesRepo.deleteAddress(id);
    result.fold(
      (failure) => {
        emit(
          AddressesFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        addresses.removeWhere((element) => element.id == id),
        emit(
          AddressesSuccess(data: addresses),
        ),
      },
    );
  }
}
