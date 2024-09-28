import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/widgets/price_widget.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_provider_image.dart';
import 'package:flutter/material.dart';

class ServiceDetailsExhibitsCard extends StatefulWidget {
  final bool viewPrice;
  final void Function()? onTap;
  final bool? isSelected;
  const ServiceDetailsExhibitsCard({
    super.key,
    this.viewPrice = true,
    this.onTap,
    this.isSelected = false,
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
            const ServiceProvidersImage(
              imageUrl:
                  'https://www.shutterstock.com/image-vector/sale-banner-template-design-geometric-260nw-1988294282.jpg',
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
                    const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'توضيب مكائن جميع السيارات',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle14_700Black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'توضيب وصيانة كل المكائن وعمل ضمان كامل لجميع السيارات كاملة مع ضمان شهري ,السعودية',
                        maxLines: widget.viewPrice ? 2 : 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle12_700Grey,
                      ),
                    ),
                    if (widget.viewPrice)
                      const PriceWidget(
                        price: '100',
                        discount: '50',
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
