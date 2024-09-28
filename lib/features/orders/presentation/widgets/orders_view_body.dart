import 'package:car_help/features/orders/presentation/widgets/orders_controller.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  final String orderType;
  final String orderStatus;
  const OrdersViewBody({
    super.key,
    required this.orderType,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return OrdersController(
      orderStatuse: orderStatus,
      orderType: orderType,
    );
  }
}
