import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';
import 'package:car_help/features/location/domain/entities/place_suggestion_entity.dart';
import 'package:car_help/features/location/domain/usecases/fetch_suggestion_location_use_case.dart';
import 'package:car_help/features/location/domain/usecases/get_address_title_by_location_use_case.dart';
import 'package:car_help/features/location/domain/usecases/get_my_location_use_case.dart';
import 'package:car_help/features/location/domain/usecases/get_place_location_by_id_use_case.dart';
import 'package:car_help/features/location/domain/usecases/update_my_location_use_case.dart';
import 'package:location/location.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetMyLocationUseCase getMyLocationUseCase;
  final FetchSuggestionLocationUseCase _fetchSuggestionLocationUseCase;
  final GetPlaceLocationByIdUseCase _getPlaceLocationByIdUseCase;
  final GetAddressTitleByLocationUseCase _getAddressTitleByLocationUseCase;

  LocationCubit(
    this.getMyLocationUseCase,
    this._fetchSuggestionLocationUseCase,
    this._getPlaceLocationByIdUseCase,
    this._getAddressTitleByLocationUseCase,
  ) : super(LocationInitial());

  static LocationCubit get(context) => BlocProvider.of(context);

  GoogleMapController? googleMapController;
  Set<Marker> markers = <Marker>{};
  LatLng? selectedLocationPoint;

  Future<void> initMapController(GoogleMapController controller) async {
    googleMapController = controller;
    emit(InitMapControllerSuccess());
  }

  Future<void> addMarkersToList(LatLng latLng) async {
    markers.add(
        Marker(markerId: const MarkerId(AppStrings.user), position: latLng));
    selectedLocationPoint = latLng;
    emit(AddMarkersSuccessfullyState(latLng: latLng));
  }

  Future<void> animatedCameraToNewLocation({required LatLng latLng}) async {
    if (googleMapController != null) {
      googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 12)));
    }
  }

  LocationData? locationData;

  Future<void> getMyLocation() async {
    emit(GetMyLocationLoading());
    final response = await getMyLocationUseCase();
    response.fold((l) => emit(GetMyLocationFailure(msg: l.errMessage)), (r) {
      locationData = r;
      emit(GetMyLocationSuccess());
    });
  }

  Future<void> fetchSuggestionList({required String query}) async {
    emit(FetchSuggestionLoading());
    final response = await _fetchSuggestionLocationUseCase(
        query: query, sessionToken: AppStrings.sessionToken);
    emit(response.fold((l) => FetchSuggestionFailure(msg: l.errMessage),
        (r) => FetchSuggestionSuccess(placeSuggestionEntityList: r)));
  }

  Future<void> getPlaceLocationById({required String placeId}) async {
    emit(GetPlaceLocationByIdLoading());
    final response = await _getPlaceLocationByIdUseCase(
        placeId: placeId, sessionToken: AppStrings.sessionToken);
    emit(response.fold((l) => GetPlaceLocationByIdFailure(msg: l.errMessage),
        (r) => GetPlaceLocationByIdSuccess(addressEntity: r)));
  }

  LocationEntity? locationEntity;

  Future<void> getAddressTitleByLocation({required LatLng latLng}) async {
    emit(GetLocationTitleLoading());
    final response = await _getAddressTitleByLocationUseCase(latLng: latLng);
    response.fold((l) => emit(GetLocationTitleFailure(errorMsg: l.errMessage)),
        (r) {
      locationEntity = r;
      emit(GetLocationTitleSuccess(locationEntity: r));
    });
  }
}
