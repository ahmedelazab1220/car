import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/loading_widget%20copy.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/location/presentation/cubit/location_cubit.dart';
import 'package:car_help/features/location/presentation/widgets/floating_search_bar.dart';
import 'package:car_help/features/location/presentation/widgets/map_design.dart';
import 'package:car_help/config/function/location_di.dart' as location_di;
import 'package:go_router/go_router.dart';

class PickLocationScreen extends StatelessWidget {
  const PickLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => location_di.sl<LocationCubit>()..getMyLocation(),
      child: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is UpdateMyLocationFailure) {
            snackbarError(context, state.msg);
          } else if (state is GetLocationTitleSuccess) {
            Future.delayed(
              const Duration(seconds: 1),
              () {
                GoRouter.of(context).pop(state.locationEntity);
              },
            );
          }
        },
        builder: (context, state) {
          LocationCubit cubit = LocationCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: state is GetMyLocationLoading
                  ? Center(
                      child: AppText(
                          text: "${S.of(context).choose} ...",
                          fontWeight: FontWeight.bold,
                          textSize: 14),
                    )
                  : Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomMapWidget(locationData: cubit.locationData!),
                        FloatingSearchBarDesign(),
                        Visibility(
                          visible: cubit.markers.isNotEmpty,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.bodyHeight * .02,
                                vertical: SizeConfig.bodyHeight * .15),
                            child: state is UpdateMyLocationLoading
                                ? const LoadingWidget()
                                : CustomButton(
                                    isLoading: state is GetLocationTitleLoading,
                                    title: S.of(context).choose,
                                    onPressed: () =>
                                        cubit.getAddressTitleByLocation(
                                            latLng:
                                                cubit.selectedLocationPoint!)),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
