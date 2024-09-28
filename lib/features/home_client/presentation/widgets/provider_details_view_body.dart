import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/custom_content.dart';
import 'package:car_help/features/home_client/presentation/widgets/custom_rate.dart';
import 'package:car_help/features/home_client/presentation/widgets/daily_working_hours_widget.dart';
import 'package:car_help/features/home_client/presentation/widgets/location_widget.dart';
import 'package:car_help/features/home_client/presentation/widgets/provider_details_appbar.dart';
import 'package:car_help/features/home_client/presentation/widgets/provider_details_images_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProviderDetailsViewBody extends StatelessWidget {
  final ProviderEntity data;
  const ProviderDetailsViewBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ProviderDetailsAppBar(data: data),
              ProviderDetailsImagesWidget(data: data),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      spacing: 4,
                      runSpacing: 10,
                      children: data.categories!.map((e) {
                        return CustomContent(
                          name: e.name ?? '',
                        );
                      }).toList(),
                    ),
                    const Spacer(),
                    const CustomRate(
                      rate: 4.5,
                    ),
                  ],
                ),
                Text(
                  data.name ?? '',
                  style: AppStyles.textStyle18_900,
                ),
                LocationWidget(
                    city: data.city?.title ?? '',
                    governorateUnit: data.district?.title ?? ''),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.directions,
                      size: 16,
                      color: AppColors.darkGrey,
                    ),
                    const SizedBox(
                      width: 4,
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
                const SizedBox(
                  height: 4,
                ),
                Text(
                  S.of(context).description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppStyles.textStyle14_800Black.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  data.about ?? '',
                  style: AppStyles.textStyle12_700,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  S.of(context).workHours,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppStyles.textStyle14_800Black
                      .copyWith(color: AppColors.primary),
                ),
                DailyWorkingHoursWidget(
                  providerId: data.id ?? 0,
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
