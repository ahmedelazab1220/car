import 'package:car_help/config/helper/helper.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_provider_image.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrdersCard extends StatelessWidget {
  final OrderEntity data;
  final void Function()? onTap;
  const OrdersCard({super.key, this.onTap, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: SizedBox(
          height: 100,
          child: Row(children: [
            ServiceProvidersImage(imageUrl: data.provider?.profileImage),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        data.provider?.name ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle14_700Black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        '${S.of(context).orderNumber} ${data.id}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle12_700Grey,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        formatTimestamp(
                            data.createdAt ?? DateTime.now(), context),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle12_600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
