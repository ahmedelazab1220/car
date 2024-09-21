import 'package:car_help/core/api/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:car_help/features/location/domain/entities/place_suggestion_entity.dart';
import 'package:car_help/features/location/domain/repositories/location_repository.dart';

class FetchSuggestionLocationUseCase {
  final LocationRepository locationRepository;

  FetchSuggestionLocationUseCase({required this.locationRepository});

  Future<Either<Failure, List<PlaceSuggestionEntity>>> call(
      {required String query, required String sessionToken}) async {
    return await locationRepository.fetchSuggestionLocation(
        query: query, sessionToken: sessionToken);
  }
}
