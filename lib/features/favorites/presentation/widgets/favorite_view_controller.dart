import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/favorites/presentation/manager/favorite%20cubit/favorite_cubit.dart';
import 'package:car_help/features/favorites/presentation/widgets/favorits_view_body.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
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
  void initState() {
    BlocProvider.of<FavoriteCubit>(context).getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<FavoriteCubit>(context).getFavorite();
      },
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteFailure) {
            return FailuresWidget(
              errorMessage: state.errorMessage,
              viewIcon: false,
            );
          } else if (state is FavoriteSuccess) {
            if (state.data.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).noFavorites,
                  style: AppStyles.textStyle16_700Grey,
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
    );
  }
}
