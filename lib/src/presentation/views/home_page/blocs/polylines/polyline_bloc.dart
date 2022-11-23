import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

part 'polyline_event.dart';
part 'polyline_state.dart';

class PolyLineBloc extends Bloc<PolyLineEvent, PolyLineState> {
  PolyLineBloc() : super(const PolylineInitial()) {
    on<DecodePolyLineEvent>((event, emit) {
      try {
        final List<PointLatLng> decodeResult =
            PolylinePoints().decodePolyline(event.encodedOrderPolyLine);

        final List<PointLatLng> driverPolyLineResult =
            PolylinePoints().decodePolyline(event.encodedPickUpPolyLine);

        List<LatLng> points = [];
        for (var pointLatLng in decodeResult) {
          points.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
        }

        List<LatLng> driverPoints = [];
        for (var pointLatLng in driverPolyLineResult) {
          driverPoints.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
        }

        Set<Polyline> polyLines = {};
        polyLines.add(Polyline(
          polylineId: const PolylineId('order_polyline'),
          points: points,
          color: AppColors.appGreen,
        ));
        polyLines.add(Polyline(
          polylineId: const PolylineId('driver_polyline'),
          points: driverPoints,
          color: AppColors.black,
        ));

        emit(DecodingSuccess(polyLines, event.latLngBounds, event.markers));
      } catch (e) {
        emit(DecodingFailure(e.toString()));
      }
    });

    on<ClearPolyLinesEvent>((event, emit) {
      emit(ClearPolyLines());
    });
  }
}
