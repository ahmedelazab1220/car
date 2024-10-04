import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/custom_content.dart';
import 'package:car_help/features/home_client/presentation/widgets/custom_rate.dart';
import 'package:car_help/features/home_client/presentation/widgets/location_widget.dart';
import 'package:car_help/features/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

class CategoriesDetailsCard extends StatelessWidget {
  final ProviderEntity data;
  const CategoriesDetailsCard({
    super.key,
    this.onTap,
    required this.data,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                  height: 126,
                  width: double.maxFinite,
                  imageUrl: data.profileImage,
                  borderRadius: BorderRadius.circular(12)),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.textStyle14_700Black,
                        ),
                        LocationWidget(
                          city: data.city?.title ?? '',
                          governorateUnit: data.district?.title ?? '',
                        ),
                        Text(
                          'يبعد عنك 11,53 كم',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppStyles.textStyle14_700Black.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomRate(
                      rate: data.averageRate ?? 0,
                    ),
                  ],
                ),
              ),
              Wrap(
                spacing: 4,
                runSpacing: 10,
                children: data.categories!.map((e) {
                  return CustomContent(
                    name: e.name ?? '',
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
