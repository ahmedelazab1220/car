import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/custom_content.dart';
import 'package:car_help/features/home_client/presentation/widgets/custom_rate.dart';
import 'package:car_help/features/home_client/presentation/widgets/location_widget.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_provider_image.dart';
import 'package:flutter/material.dart';

class ServiceProvidersCard extends StatelessWidget {
  final ProviderEntity data;
  const ServiceProvidersCard({
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
          height: 160,
          child: Row(children: [
            ServiceProvidersImage(imageUrl: data.profileImage ?? ''),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            data.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.textStyle14_700Black,
                          ),
                        ),
                        const Spacer(),
                        CustomRate(
                          rate: data.averageRate ?? 0,
                        ),
                      ],
                    ),
                    LocationWidget(
                      city: data.city?.title ?? '',
                      governorateUnit: data.district?.title ?? '',
                    ),
                    const SizedBox(
                      height: 4,
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
          ]),
        ),
      ),
    );
  }
}
