import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/features/home_provider/presentation/views/customer_orders_details_view.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomerOrdersListView extends StatelessWidget {
  final List<OrderEntity> data;
  const CustomerOrdersListView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return OrdersCard(
              data: data[index],
              onTap: () {
                GoRouter.of(context).push(AppRouter.kCustomerOrdersDetailsView,
                    extra: data[index]);
              });
        },
      ),
    );
  }
}
