import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/orders/presentation/widgets/price_offer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceOffersWidget extends StatelessWidget {
  const PriceOffersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int index = 2;
    return index > 0
        ? const PriceOfferListView()
        : Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(AppAssets.prices),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text('لا يوجد عرض أسعار حتي الان!',
                        style: AppStyles.textStyle14_800Black),
                  ],
                ),
              ],
            ),
          );
  }
}
