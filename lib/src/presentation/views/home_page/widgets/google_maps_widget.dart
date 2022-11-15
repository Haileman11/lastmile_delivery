import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  BitmapDescriptor? icon;
  Set<Polyline> polyLines = {};
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
    return BlocBuilder<PolyLineBloc, PolyLineState>(
      builder: (context, state) {
        print("POLYLINE STATE >>>>>>>>>>>>>> $state");
        if (state is DecodingSuccess) {
          polyLines = state.polyLines;
          if (AppValues.mapController.isCompleted) {
            AppValues.controller!.animateCamera(
              CameraUpdate.newLatLngBounds(
                state.latLngBounds,
                50.0,
              ),
            );
          }
        }

        if (state is DecodingFailure) {
          print('POLYLINE ERROR >>>>>>>>>>> ${state.decodingError}');
        }

        if (state is ClearPolyLines) {
          polyLines.clear();
        }

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
                polylines: polyLines,
                markers: {
                  Marker(
                    markerId: const MarkerId('driver_marker'),
                    icon: icon ?? BitmapDescriptor.defaultMarker,
                    position: LatLng(
                        state.position.latitude, state.position.longitude),
                    rotation: state.position.heading,
                  ),
                },
                initialCameraPosition: CameraPosition(
                  target:
                      LatLng(state.position.latitude, state.position.longitude),
                  zoom: 16,
                ),
                onMapCreated: (GoogleMapController controller) {
                  if (!AppValues.mapController.isCompleted) {
                    AppValues.mapController.complete(controller);
                    AppValues.controller = controller;

                    /// DELETE THIS
                    BlocProvider.of<PolyLineBloc>(context).add(
                      DecodePolyLineEvent(
                        'olpaGj{upLwAdAi@l@m@bASd@Qd@QKW]GIo@}A{DcK{AaGi@q@UGYd@mBtBoAbAa@f@o@DKFkAH}DHaDJYN}@x@sA`Ak@jAi@`AqBlAyFzCgAPm@\\k@b@]FaALuJmOmCaDyEgGoCqEu@y@w@{@KX]r@yA|Cc@dCaEnPsFjT{Nr^gI~S{@tB}AhAMJq@Nm@Go@@OJUXMv@B`@`@t@|@ZLd@Cr@iBbFs@dBoJtL}O`UmAjB{A|A_@n@yAnAaAt@mEvDcAhAuCpEkAhBu@bBuExG{FpIgMlQaFnFoE|DwRpPsN`M_EjDY?sAr@eCv@cAJ{CKoF_@wA?m@LmBbA}@hAy@tB}BhLsAtD}JfPwA`Ew@rDg@rBq@zAuAfCs@pDm@jB_@t@_ArCSrCSzM]|UJ`HArGHlB`@vCf@bBn@hAp@v@PDVF^ZPx@b@fBnAxC~AhCvAjBlBdB`D~Cd@~@TVPAFIZUt@OdCD|@I|Bk@dCOfCHhAGvBa@|Ba@|@B~@^t@l@pAnBnBrE`B`C~ClCtAl@|BZxJKvBHp@Vt@l@fCfCfCxBpBxBt@rA^vA^~EZzEb@dBjBvC~BrB~@tCFb@]jC}@hEqEfTkJjc@yGjQgG`MwAvCy@`CmE`UkDdQ{GxVoFrTsDpSoAvLyBbTaAvFeBjH{C~LgDvLyGjT}BpK{Ft\\cAhKg@lIi@rZ_@|Pg@lJq@~HaBxLyArH{CbLuCjJsApGs@dGUzDSbJCdDMZ?BYjE[|DWbDM\\o@l@uAFo@EgAAo@GuCUaE[sGe@{BO_BAyBh@kFtBeJpFyDzBkDdA{MhC{Jv@aAOmAaAwCyCcAq@o@UsA_@uA{@iA{@iAyAcDkEoEmEqDuCqAy@gG}A{@c@uCgC{AsA][g@nA}@rBwAdD_AtBg@jAAh@yBzIQbEZpQ`D|W~@zHfArFXlCAbFLnCbBrJFrAIjCXrFAtG^lJQ~EUnFj@`IbAxDxAnEVpBE|D_@tHHhB~@xB\\h@wAtBu@dAoDdFa@`Ag@jC_AzI}AvSi@pG[tIi@lTPhD`@fEN`NFvT@fCQhBeBvGgFzKkBdG_@vBWdDg@vGsAjRiDpf@eBxd@}AhGmEdJyBzG_BfDmFlJiBjFYdBOtDOfBs@hD{D`Nu@~C[hEZbGU~JB`FVvGr@nIf@`IHpEV`Cl@fDPnCVbJj@zKCzBu@tKc@zD{@fE{BnD_A~Am@hBmAvCk@Zk@h@kBtAi@`@Tx@jBmAx@m@RW',
                        LatLngBounds(
                          northeast: const LatLng(42.4614275, -71.0552091),
                          southwest: const LatLng(42.3599162, -71.3496743),
                        ),
                      ),
                    );
                  }
                },
              );
            }
            return const SizedBox(
              key: const Key('GOOGLE_MAPS_WIDGET'),
            );
          },
        );
      },
    );
  }
}
