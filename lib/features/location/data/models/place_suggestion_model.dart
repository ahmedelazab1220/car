import 'package:car_help/features/location/domain/entities/place_suggestion_entity.dart';

class PlaceSuggestionModel extends PlaceSuggestionEntity {
  const PlaceSuggestionModel(
      {required super.placeId, required super.description});

  factory PlaceSuggestionModel.fromJson(Map<String, dynamic> json) =>
      PlaceSuggestionModel(
          placeId: json['place_id'], description: json['description']);
}
