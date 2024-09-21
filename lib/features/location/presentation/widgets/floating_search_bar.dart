import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:car_help/config/theme/app_theme.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/location/presentation/cubit/location_cubit.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'place_suggesstion_list_design.dart';

class FloatingSearchBarDesign extends StatelessWidget {
  final FloatingSearchBarController controller = FloatingSearchBarController();
  FloatingSearchBarDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is GetPlaceLocationByIdSuccess) {
          LatLng latLng = LatLng(
              state.addressEntity.latitude!, state.addressEntity.longitude!);
          LocationCubit.get(context)
              .animatedCameraToNewLocation(latLng: latLng);
          controller.close();
        }
      },
      builder: (context, state) {
        return FloatingSearchBar(
          elevation: 6,
          controller: controller,
          hintStyle: hintTFFTextStyle(),
          queryStyle: mainTFFTextStyle(context),
          hint: S.of(context).choose,
          height: SizeConfig.bodyHeight * .08,
          scrollPadding: EdgeInsets.only(
              top: SizeConfig.bodyHeight * .02,
              bottom: SizeConfig.bodyHeight * .08),
          transitionDuration: const Duration(milliseconds: 600),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          openAxisAlignment: 0.0,
          debounceDelay: const Duration(milliseconds: 600),
          onFocusChanged: (isFocused) {},
          onQueryChanged: (query) => BlocProvider.of<LocationCubit>(context)
              .fetchSuggestionList(query: query),
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: CircularButton(
                icon: Icon(Icons.my_location, color: AppColors.primary),
                onPressed: () {},
              ),
            ),
          ],
          builder: (context, transition) =>
              PlaceSuggestionListDesign(controller: controller),
        );
      },
    );
  }
}
