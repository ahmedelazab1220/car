import 'package:car_help/core/utils/app_constant.dart';
import 'package:car_help/features/my_services/presentation/views/my_service_details_view.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_card.dart';
import 'package:flutter/material.dart';

class MyServicesListView extends StatelessWidget {
  final int requestStatusIndex;
  const MyServicesListView({
    super.key,
    required this.requestStatusIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return SizedBox();
          //  OrdersCard(onTap: () {}

          // AppConstant.navigateTo(
          //   context,
          //    MyServiceDetailsView(requestStatusIndex: requestStatusIndex,),
          // ),
          // );
        },
      ),
    );
  }
}
