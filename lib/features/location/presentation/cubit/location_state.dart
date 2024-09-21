part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class InitMapControllerSuccess extends LocationState {}

class AddMarkersSuccessfullyState extends LocationState {
  final LatLng latLng;

  const AddMarkersSuccessfullyState({required this.latLng});

  @override
  List<Object> get props => [latLng];
}

class GetMyLocationLoading extends LocationState {}

class GetMyLocationSuccess extends LocationState {
  final LocationEntity locationEntity;
  final LocationData locationData;

  const GetMyLocationSuccess(
      {required this.locationEntity, required this.locationData});

  @override
  List<Object> get props => [locationEntity, locationData];
}

class GetMyLocationFailure extends LocationState {
  final String msg;

  const GetMyLocationFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}

class FetchSuggestionLoading extends LocationState {}

class FetchSuggestionSuccess extends LocationState {
  final List<PlaceSuggestionEntity> placeSuggestionEntityList;

  const FetchSuggestionSuccess({required this.placeSuggestionEntityList});

  @override
  List<Object> get props => [placeSuggestionEntityList];
}

class FetchSuggestionFailure extends LocationState {
  final String msg;

  const FetchSuggestionFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}

class GetPlaceLocationByIdLoading extends LocationState {}

class GetPlaceLocationByIdSuccess extends LocationState {
  final LocationEntity addressEntity;

  const GetPlaceLocationByIdSuccess({required this.addressEntity});

  @override
  List<Object> get props => [addressEntity];
}

class GetPlaceLocationByIdFailure extends LocationState {
  final String msg;

  const GetPlaceLocationByIdFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}

class UpdateMyLocationLoading extends LocationState {}

class UpdateMyLocationSuccess extends LocationState {
  final String msg;

  const UpdateMyLocationSuccess({required this.msg});

  @override
  List<Object> get props => [msg];
}

class UpdateMyLocationFailure extends LocationState {
  final String msg;

  const UpdateMyLocationFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
