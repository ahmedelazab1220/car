import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_constant.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/widgets/order_details_view_body.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersListView extends StatelessWidget {
  final String? orderStatuse;
  final String? orderType;
  final List<OrderEntity> data;

  const OrdersListView({
    super.key,
    required this.data,
    this.orderStatuse,
    this.orderType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return OrdersCard(
            data: data[index],
            onTap: () {
              GoRouter.of(context).push(AppRouter.kOrderDetailsView,
                  extra: [orderStatuse, orderType, data[index]]);
            },
           
          );
        },
      ),
    );
  }
}
