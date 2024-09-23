import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/addresses/domain/entities/address_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AddressesRepo {
  Future<Either<Failure, List<AddressEntity>>> getAddresses();
  Future<Either<Failure, String>> addAddress(AddressEntity address);
  Future<Either<Failure, String>> deleteAddress(int? id);
  Future<Either<Failure, String>> updateAddress(AddressEntity address);
}
