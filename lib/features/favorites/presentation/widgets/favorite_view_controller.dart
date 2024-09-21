import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/favorites/domain/repos/favorite_repo.dart';
import 'package:car_help/features/favorites/presentation/manager/favorite%20cubit/favorite_cubit.dart';
import 'package:car_help/features/favorites/presentation/widgets/favorits_view_body.dart';
import 'package:car_help/features/home_client/presentation/manager/home%20cubit/home_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/banner_loading_card.dart';
import 'package:car_help/features/home_client/presentation/widgets/loading_list_view.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_providers_list_view.dart';
import 'package:car_help/features/start/presentation/widgets/Custom_slider.dart';
import 'package:car_help/features/widgets/custom_network_image.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewController extends StatefulWidget {
  const FavoriteViewController({
    super.key,
  });

  @override
  State<FavoriteViewController> createState() => _FavoriteViewControllerState();
}

class _FavoriteViewControllerState extends State<FavoriteViewController> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavoriteCubit(getIt.get<FavoriteRepo>())..getFavorite(),
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<FavoriteCubit>(context).getFavorite();
        },
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const LoadingListView();
            } else if (state is FavoriteFailure) {
              return FailuresWidget(
                errorMessage: state.errorMessage,
                viewIcon: false,
              );
            } else if (state is FavoriteSuccess) {
              if (state.data.isEmpty) {
                return const SizedBox(
                  height: 167,
                  width: double.maxFinite,
                  child: Center(
                    child: Text(
                      'لا توجد مقدمي خدمات بالقرب منك',
                      style: AppStyles.textStyle16_700Grey,
                    ),
                  ),
                );
              }
              return FavoritsViewBody(
                data: state.data,
              );
            }
            return const Center(
              child: Text('Somthing Was Rong'),
            );
          },
        ),
      ),
    );
  }
}
