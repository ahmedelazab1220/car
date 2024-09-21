import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/manager/home%20cubit/home_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/banner_loading_card.dart';
import 'package:car_help/features/start/presentation/widgets/Custom_slider.dart';
import 'package:car_help/features/widgets/custom_network_image.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerController extends StatefulWidget {
  const BannerController({
    super.key,
  });

  @override
  State<BannerController> createState() => _BannerControllerState();
}

class _BannerControllerState extends State<BannerController> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const BannerLoadingCard();
        } else if (state is HomeFailure) {
          return FailuresWidget(
            errorMessage: state.errorMessage,
            viewIcon: false,
          );
        } else if (state is HomeSuccess) {
          List<Widget> getImages() {
            return List<Widget>.generate(state.banners!.length, (index) {
              return CustomNetworkImage(
                width: double.maxFinite,
                radius: 8,
                imageUrl: state.banners![index].image,
              );
            });
          }

          if (state.banners!.isEmpty) {
            return const SizedBox(
              height: 167,
              width: double.maxFinite,
              child: Center(
                child: Text(
                  'لا توجد بانرات',
                  style: AppStyles.textStyle16_700Grey,
                ),
              ),
            );
          }
          return CustomSlider(
            imgList: getImages(),
            height: 157,
          );
        }
        return const Center(
          child: Text('Somthing Was Rong'),
        );
      },
    );
  }
}
