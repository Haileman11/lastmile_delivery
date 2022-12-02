import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';

class MapsView extends StatelessWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil(context: context).getScreenHeight() * 0.25,
      child: const GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(9.005401, 8.763611)),
        mapType: MapType.normal,
        mapToolbarEnabled: false,
        rotateGesturesEnabled: false,
        scrollGesturesEnabled: false,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        compassEnabled: false,
        myLocationButtonEnabled: false,
      ),
    );
  }
}
