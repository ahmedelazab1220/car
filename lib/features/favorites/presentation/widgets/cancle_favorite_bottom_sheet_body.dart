import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/favorites/presentation/manager/toggle%20favorite%20cubit/toggle_favorite_cubit.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancleFavoriteBottomSheetBody extends StatefulWidget {
  final ProviderEntity data;
  const CancleFavoriteBottomSheetBody({super.key, required this.data});

  @override
  State<CancleFavoriteBottomSheetBody> createState() =>
      _CancleFavoriteBottomSheetBodyState();
}

class _CancleFavoriteBottomSheetBodyState
    extends State<CancleFavoriteBottomSheetBody> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Container(
                width: SizeConfig.screenWidth * .2,
                height: 5,
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              SvgPicture.asset(AppAssets.warning),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText(
                text: S.of(context).cancelFavoritesMsg,
                fontWeight: FontWeight.bold,
                textSize: 16,
                color: AppColors.black,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Text(
                textAlign: TextAlign.center,
                S.of(context).cancelFavoritesDesc,
                style: AppStyles.textStyle12_700Grey,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              CustomButton(
                  borderColor: AppColors.black,
                  titleColor: AppColors.white,
                  color: AppColors.black,
                  title: S.of(context).cancelFavorite,
                  onPressed: () {
                    widget.data.inWishlist = false;
                    BlocProvider.of<ToggleFavoriteCubit>(context)
                        .toggleFavorite(id: widget.data.id);
                    Navigator.pop(context);
                  }),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Center(
                      child: AppText(
                    text: S.of(context).skip,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    textSize: 18,
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
