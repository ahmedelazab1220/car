import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/features/favorites/domain/repos/favorite_repo.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/favorites/presentation/manager/toggle%20favorite%20cubit/toggle_favorite_cubit.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/snackbar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSave extends StatefulWidget {
  final ProviderEntity data;
  const BottomSave({super.key, required this.data});

  @override
  State<BottomSave> createState() => _BottomSaveState();
}

class _BottomSaveState extends State<BottomSave> {
  bool isSaved = false;
  @override
  void initState() {
    isSaved = widget.data.inWishlist ?? false;
    super.initState();
  }

  bool save = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleFavoriteCubit(getIt.get<FavoriteRepo>()),
      child: BlocConsumer<ToggleFavoriteCubit, ToggleFavoriteState>(
        listener: (context, state) {
          save = false;
          if (state is ToggleFavoriteFailure) {
            save = true;
            snackbarError(context, state.errorMessage);
          } else if (state is ToggleFavoriteSuccess) {
            save = true;
            snackbarSuccess(context, state.message);
          }
        },
        builder: (context, state) {
          return IconButton(
              icon: Icon(
                isSaved == false
                    ? Icons.favorite_border_outlined
                    : Icons.favorite,
                color: isSaved == false ? AppColors.white : AppColors.primary,
                size: 30,
              ),
              onPressed: save
                  ? () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                      widget.data.inWishlist = isSaved;
                      BlocProvider.of<ToggleFavoriteCubit>(context)
                          .toggleFavorite(id: widget.data.id);
                    }
                  : null);
        },
      ),
    );
  }
}
