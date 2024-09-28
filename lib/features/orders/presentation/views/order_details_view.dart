import 'package:car_help/features/orders/presentation/widgets/order_details_view_controller.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  final List list;

  const OrderDetailsView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return OrderDetailsViewController(
      list: list,
    );
  }
}
