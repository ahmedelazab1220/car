import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CategoriesCard extends StatelessWidget {
  final ServiceEntity data;
  final String? lat, lng, address;

  const CategoriesCard(
      {super.key, required this.data, this.lat, this.lng, this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () => GoRouter.of(context)
            .push(AppRouter.kCategoryDetailsView, extra: data),
        child: Card(
          shadowColor: AppColors.containerPrimary,
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.network(
                  height: SizeConfig.screenWidth * 0.08,
                  width: SizeConfig.screenWidth * 0.08,
                  data.icon ??
                      'https://admin.carhelp.com.sa/storage/3d90f9361298a10deac075c12c5dc397/2.svg',
                ),
                SizedBox(height: SizeConfig.bodyHeight * .015),
                AppText(
                  align: TextAlign.center,
                  text: data.name ?? '',
                  color: AppColors.black,
                  textSize: 12,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
