import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/presentation/exhibits_helper.dart';
import 'package:car_help/features/home_client/presentation/widgets/price_widget.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_provider_image.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ExhibitsCard extends StatelessWidget {
  final bool noPrice;
  final ExhibitsEntity data;
  const ExhibitsCard({
    super.key,
    this.onTap,
    this.noPrice = true,
    required this.data,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: null,
          child: SizedBox(
            height: 120,
            child: Row(children: [
              ServiceProvidersImage(
                  imageUrl:
                      data.images!.isNotEmpty ? data.images?.first : null),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.58,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => GoRouter.of(context)
                                .push(AppRouter.kAddExhibitView, extra: data),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.edit,
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  S.of(context).delete,
                                  style: AppStyles.textStyle12_700,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () => ExhibitsHelper.showBottomSheetDialog(
                                context: context, data: data),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.deleteIcon,
                                  height: 14,
                                  width: 14,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  S.of(context).delete,
                                  style: AppStyles.textStyle12_700,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          data.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.textStyle14_700Black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          data.description ?? '',
                          maxLines: noPrice ? 2 : 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.textStyle12_700Grey,
                        ),
                      ),
                      if (noPrice)
                        PriceWidget(
                          price: data.price.toString(),
                          discount: data.priceAfterDiscount?.toString(),
                        )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
