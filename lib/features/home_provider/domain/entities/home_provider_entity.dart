import 'package:car_help/features/orders/domain/entities/order_entity.dart';

class HomeProviderEntity {
  List<OrderEntity>? exhibts;
  int? pending;
  int? inProgress;
  int? completed;
  int? canceled;
  HomeProviderEntity({
    this.exhibts,
    this.pending,
    this.inProgress,
    this.completed,
    this.canceled,
  });
}
