import 'package:car_help/config/helper/helper.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/widgets/row_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  final OrderEntity data;
  const OrderSummaryCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          RowWidget(
            name: S.of(context).orderNumber,
            description: data.id.toString(),
          ),
          RowWidget(
            name: S.of(context).orderDate,
            description:
                formatTimestamp(data.createdAt ?? DateTime.now(), context),
          ),
          RowWidget(
            name: S.of(context).carModel,
            description: data.userCar?.manufactureYear ?? '',
          ),
          RowWidget(
            name: S.of(context).carType,
            description: data.userCar?.carModel?.title ?? '',
          ),
          RowWidget(
            name: S.of(context).carBrand,
            description: data.userCar?.carFactory?.title ?? '',
          ),
          RowWidget(
            name: S.of(context).serviceType,
            description: data.category?.name ?? '',
          ),
          RowWidget(
              name: S.of(context).orderDetails,
              description: data.description ?? ''),
        ],
      ),
    );
  }
}
