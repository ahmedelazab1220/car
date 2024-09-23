import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/my_cars/doman/entities/car_factory_entity.dart';

class MyCarsEntity {
  int? id;
  CarFactoryEntity? carFactory;
  DropDownEntity? carModel;
  String? manufactureYear;
  MyCarsEntity({
    this.id,
    this.carFactory,
    this.carModel,
    this.manufactureYear,
  });
}
