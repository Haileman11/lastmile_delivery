import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  BitmapDescriptor? icon;

  @override
  void initState() {
    getDriverIcon();
    super.initState();
  }

  Future getDriverIcon() async {
    icon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      Platform.isAndroid
          ? "assets/images/map_icon_driver.png"
          : "assets/images/map_icon_driver_ios_70_45.png",
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverLocationBloc, DriverLocationState>(
      builder: (context, state) {
        if (state is DriverLocationLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.appBlack,
            ),
          );
        }

        if (state is DriverLocationError) {
          return Center(
            child: Text(state.errorMessage),
          );
        }

        if (state is DriverLocationDone) {
          /// UPDATE DRIVER LOCATION
          final socketState = BlocProvider.of<SocketBloc>(context).state;
          if (socketState is SocketConnected) {
            BlocProvider.of<UpdateLocationBloc>(context).add(UpdateLocation(
                'fake_id',
                LatLng(state.position.latitude, state.position.longitude)));
          }
          return GoogleMap(
            key: const Key('GOOGLE_MAPS_WIDGET'),
            mapType: MapType.normal,
            mapToolbarEnabled: false,
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            tiltGesturesEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            compassEnabled: false,
            myLocationButtonEnabled: false,
            markers: {
              Marker(
                markerId: const MarkerId('driver_marker'),
                icon: icon ?? BitmapDescriptor.defaultMarker,
                position:
                    LatLng(state.position.latitude, state.position.longitude),
                rotation: state.position.heading,
              ),
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(state.position.latitude, state.position.longitude),
              zoom: 16,
            ),
            onMapCreated: (GoogleMapController controller) {
              if (!AppValues.mapController.isCompleted) {
                AppValues.mapController.complete(controller);
                AppValues.controller = controller;
              }
            },
          );
        }
        return const SizedBox(
          key: const Key('GOOGLE_MAPS_WIDGET'),
        );
      },
    );
  }
}
