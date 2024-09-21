import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:car_help/features/location/presentation/cubit/location_cubit.dart';
import 'package:location/location.dart';

class CustomMapWidget extends StatefulWidget {
  final LocationData locationData;

  const CustomMapWidget({super.key, required this.locationData});

  @override
  State<CustomMapWidget> createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends State<CustomMapWidget> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: CameraPosition(
        target: LatLng(
            widget.locationData.latitude!, widget.locationData.longitude!),
        zoom: 14,
      ),
      markers: Set<Marker>.of(BlocProvider.of<LocationCubit>(context).markers),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: (controller) =>
          LocationCubit.get(context).initMapController(controller),
      zoomControlsEnabled: true,
      onTap: (latLng) async =>
          BlocProvider.of<LocationCubit>(context).addMarkersToList(latLng),
    );
  }
}
