import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/price_widget.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_provider_image.dart';
import 'package:flutter/material.dart';

class ServiceDetailsExhibitsCard extends StatefulWidget {
  final bool viewPrice;
  final void Function()? onTap;
  final bool? isSelected;
  final ExhibitsEntity data;
  const ServiceDetailsExhibitsCard({
    super.key,
    this.viewPrice = true,
    this.onTap,
    this.isSelected = false,
    required this.data,
  });

  @override
  State<ServiceDetailsExhibitsCard> createState() =>
      _ServiceDetailsExhibitsCardState();
}

class _ServiceDetailsExhibitsCardState
    extends State<ServiceDetailsExhibitsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.isSelected! ? AppColors.primary : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onTap,
        child: SizedBox(
          height: 130,
          child: Row(children: [
            ServiceProvidersImage(
              imageUrl: widget.data.images?.first,
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.52,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        widget.data.title ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle14_700Black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        widget.data.description ?? '',
                        maxLines: widget.viewPrice ? 2 : 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle12_700Grey,
                      ),
                    ),
                    if (widget.viewPrice)
                      PriceWidget(
                        price: widget.data.price.toString(),
                        discount: widget.data.priceAfterDiscount?.toString(),
                      )
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
