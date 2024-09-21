import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/favorites/presentation/widgets/bottom_save.dart';
import 'package:car_help/features/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ServiceDetailsAppBar extends StatelessWidget {
  final ProviderEntity data;
  const ServiceDetailsAppBar({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenWidth * 0.6,
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(16),
          left: Radius.circular(16),
        ),
        child: Stack(
          children: [
            CustomNetworkImage(
              imageUrl: data.backgroundImage,
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenWidth,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(16),
                left: Radius.circular(16),
              ),
              radius: 16,
            ),
            ColoredBox(
              color: AppColors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        BottomSave(
                          data: data,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Icon(Ionicons.share_social_outline,
                            size: 30, color: Colors.white),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        SizedBox(width: 14),
                        Text(
                          '',
                          style: AppStyles.textStyle20_700White,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
