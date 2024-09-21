import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/custom_search_widget.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_provider_card.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoritsViewBody extends StatelessWidget {
  final List<ProviderEntity> data;
  const FavoritsViewBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (data.isNotEmpty)
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'يوجد ${data.length} مقدم خدمة للصيانة المتنقلة بالقرب منك',
                    style: AppStyles.textStyle14_800Black,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ServiceProvidersCard(
                          onTap: () {}, data: data[index],
                          // onTap: () => AppConstant.navigateTo(
                          //   context,
                          //   const ServiceDetailsView(),
                          // ),
                        );
                      },
                    ),
                  ),
                ),
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
    );
  }
}
