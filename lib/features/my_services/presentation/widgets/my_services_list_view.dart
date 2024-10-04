import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/features/my_services/presentation/views/my_service_details_view.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyServicesListView extends StatelessWidget {
  final String? orderStatus;
  final List<OrderEntity> data;

  const MyServicesListView({
    super.key,
    this.orderStatus,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return OrdersCard(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kMyServiceDetailsView,
                  extra: [orderStatus, data[index]]);
            },
            data: data[index],

            // // AppConstant.navigateTo(
            // //   context,
            //    MyServiceDetailsView(),
          );
        },
      ),
    );
  }
}
