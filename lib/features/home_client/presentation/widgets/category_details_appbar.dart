import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryDetailsAppBar extends StatelessWidget {
  final String title;
  final String location;
  const CategoryDetailsAppBar({
    super.key,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenWidth * 0.45,
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(16),
          left: Radius.circular(16),
        ),
        child: Stack(
          children: [
            Image(
              image: const AssetImage(
                AppAssets.categoryBackground,
              ),
              fit: BoxFit.cover,
              width: SizeConfig.screenWidth,
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
                        SvgPicture.asset(
                          AppAssets.locationIcon,
                          color: Colors.white,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          location,
                          style: AppStyles.textStyle18_600White,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const Spacer(),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 14),
                        Text(
                          title,
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
