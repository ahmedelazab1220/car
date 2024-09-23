import 'package:car_help/core/utils/app_constant.dart';
import 'package:car_help/features/orders/presentation/views/order_details_view.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_card.dart';
import 'package:flutter/material.dart';

class OrdersListView extends StatelessWidget {
  final int typeRequestIndex;
  final int requestStatusIndex;
  const OrdersListView({
    super.key,
    required this.typeRequestIndex,
    required this.requestStatusIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return OrderssCard(onTap: () {}
              //  AppConstant.navigateTo(
              //   context,
              //   RequestDetailsView(
              //     typeRequestIndex: typeRequestIndex,
              //     requestStatusIndex: requestStatusIndex,
              //   ),
              // ),
              );
        },
      ),
    );
  }
}
