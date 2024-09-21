import 'package:car_help/features/favorites/presentation/widgets/favorite_view_controller.dart';
import 'package:car_help/features/favorites/presentation/widgets/favorits_view_body.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class FavoritsView extends StatelessWidget {
  const FavoritsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).myFavorites),
      ),
      body: const FavoriteViewController(),
    );
  }
}
