import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/favorites/domain/repos/favorite_repo.dart';
import 'package:car_help/features/favorites/presentation/manager/favorite%20cubit/favorite_cubit.dart';
import 'package:car_help/features/favorites/presentation/manager/toggle%20favorite%20cubit/toggle_favorite_cubit.dart';
import 'package:car_help/features/favorites/presentation/widgets/favorite_view_controller.dart';
import 'package:car_help/features/favorites/presentation/widgets/favorits_view_body.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritsView extends StatelessWidget {
  const FavoritsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).myFavorites),
      ),
      body: MultiBlocProvider(providers: [
      
        BlocProvider(
          create: (context) => FavoriteCubit(getIt.get<FavoriteRepo>()),
        ),
      ], child: const FavoriteViewController()),
    );
  }
}
