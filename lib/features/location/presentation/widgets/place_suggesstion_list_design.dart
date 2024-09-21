import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_help/features/location/presentation/cubit/location_cubit.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import 'place_item_design.dart';

class PlaceSuggestionListDesign extends StatelessWidget {
  final FloatingSearchBarController controller;

  const PlaceSuggestionListDesign({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is FetchSuggestionSuccess) {
          if (state.placeSuggestionEntityList.isNotEmpty) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.builder(
                          itemBuilder: (ctx, index) => PlaceItemDesign(
                                controller: controller,
                                suggestion:
                                    state.placeSuggestionEntityList[index],
                              ),
                          itemCount: state.placeSuggestionEntityList.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics())
                    ]));
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
