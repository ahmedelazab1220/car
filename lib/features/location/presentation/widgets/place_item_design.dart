import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/features/location/domain/entities/place_suggestion_entity.dart';
import 'package:car_help/features/location/presentation/cubit/location_cubit.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class PlaceItemDesign extends StatelessWidget {
  final PlaceSuggestionEntity suggestion;
  final FloatingSearchBarController controller;

  const PlaceItemDesign(
      {super.key, required this.suggestion, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            BlocProvider.of<LocationCubit>(context)
                .getPlaceLocationById(placeId: suggestion.placeId.toString());
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsetsDirectional.all(8),
            padding: const EdgeInsetsDirectional.all(4),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.6)),
                child: Icon(
                  Icons.place,
                  color: AppColors.primary,
                ),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${suggestion.description.split(',')[0]}\n',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: suggestion.description
                          .replaceAll(suggestion.description.split(',')[0], ''),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
