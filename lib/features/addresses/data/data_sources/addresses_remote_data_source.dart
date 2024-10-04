import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/addresses/data/models/address_model.dart';
import 'package:car_help/features/addresses/domain/entities/address_entity.dart';

abstract class AddressesRemoteDataSource {
  Future<List<AddressEntity>> getAddresses();

  Future<String> addAddress(AddressEntity address);

  Future<String> deleteAddress(int? id);

  Future<String> updateAddress(AddressEntity address);
}

class AddressesRemoteDataSourceImpl implements AddressesRemoteDataSource {
  final ApiService apiService;
  AddressesRemoteDataSourceImpl(
    this.apiService,
  );
  @override
  Future<List<AddressEntity>> getAddresses() async {
    var data = await apiService.get(
      endPoint: EndPoints.getAddresses,
    );

    List<AddressEntity> list = [];
    data['data'].forEach((element) {
      AddressEntity model = AddressModel.fromJson(element);
      list.add(model);
    });
    CacheHelper().cacheListData(
      List<Map<String, dynamic>>.from(data['data']),
      AppStrings.addresses,
    );
    return list;
  }

  @override
  Future<String> addAddress(AddressEntity address) async {
    var data = await apiService.post(
      endPoint: EndPoints.addAddress,
      data: {
        "owner_name": address.ownerName,
        "owner_phone": address.ownerPhone,
        "address": address.address,
        "lat": address.lat,
        "lng": address.lng,
        "is_default": address.isDefault,
      },
    );
    return data['message'];
  }

  @override
  Future<String> deleteAddress(int? id) async {
    var data = await apiService.delete(
      endPoint: '${EndPoints.deleteAddress}$id',
    );
    return data['message'];
  }

  @override
  Future<String> updateAddress(AddressEntity address) async {
    var data = await apiService.put(
      endPoint: '${EndPoints.updateAddress}${address.id}',
      data: {
        "owner_name": address.ownerName,
        "owner_phone": address.ownerPhone,
        "address": address.address,
        "lat": address.lat,
        "lng": address.lng,
        "is_default": address.isDefault,
      },
    );
    return data['message'];
  }
}
