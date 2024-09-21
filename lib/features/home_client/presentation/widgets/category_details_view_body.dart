import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_constant.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/presentation/pages/service_details_view.dart';
import 'package:car_help/features/home_client/presentation/widgets/category_details_appbar.dart';
import 'package:car_help/features/home_client/presentation/widgets/custom_search_widget.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_provider_card.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryDetailsViewBody extends StatelessWidget {
  final ServiceEntity data;

  const CategoryDetailsViewBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    int index = 0;

    return Scaffold(
      body: Column(
        children: [
          CategoryDetailsAppBar(
            title: data.name ?? '',
            location: 'مكة المكرمة',
          ),
          if (index == 0)
            Expanded(
              child: Column(
                children: [
                  const CustomSearchWidget(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'يوجد 3 مقدم خدمة للصيانة المتنقلة بالقرب منك',
                      style: AppStyles.textStyle14_800Black,
                    ),
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 6),
                  //     child: ListView.builder(
                  //       padding: const EdgeInsets.all(0),
                  //       itemCount: 5,
                  //       itemBuilder: (context, index) {
                  //         return ServiceProvidersCard(data: ,
                  //             // onTap: () => AppConstant.navigateTo(
                  //             //   context,
                  //             //   const ServiceDetailsView(),
                  //             // ),
                  //             );
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          else
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.emptyService),
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).noServiceProviders,
                      style: AppStyles.textStyle16_800,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
