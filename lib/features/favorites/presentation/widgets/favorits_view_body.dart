import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/favorites/presentation/widgets/Favorite_card.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6),
                  child: Text(
                    '${S.of(context).thereAre}${data.length} ${S.of(context).favoriteForYou}',
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
                        return FavoriteCard(
                          onTap: () {
                            GoRouter.of(context).push(
                                AppRouter.kServiceDetailsView,
                                extra: data[index]);
                          },
                          data: data[index],
                         
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
