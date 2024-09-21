import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StaticCategoriesCard extends StatelessWidget {
  final ServiceEntity data;
  const StaticCategoriesCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        // onTap: () => AppConstant.navigateTo(
        //     context,
        //     CategoryDetailsView(
        //       category: data.name ?? '',
        //     )
        //     // CategoryScreen(
        //     //   id: staticCategoriesEntity.id,
        //     //   title: staticCategoriesEntity.name,
        //     // )
        //     ),
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
                  height: SizeConfig.screenWidth * 0.1,
                  width: SizeConfig.screenWidth * 0.1,
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
