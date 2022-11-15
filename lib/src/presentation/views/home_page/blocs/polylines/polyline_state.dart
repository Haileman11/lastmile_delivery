part of 'polyline_bloc.dart';

abstract class PolyLineState extends Equatable {
  const PolyLineState();
  @override
  List<Object> get props => [];
}

class PolylineInitial extends PolyLineState {
  const PolylineInitial();
}

class DecodingFailure extends PolyLineState {
  final String decodingError;
  const DecodingFailure(this.decodingError);

  @override
  List<Object> get props => [decodingError];
}

class DecodingSuccess extends PolyLineState {
  final Set<Polyline> polyLines;
  final LatLngBounds latLngBounds;
  final Set<Marker> markers;

  const DecodingSuccess(this.polyLines, this.latLngBounds, this.markers);
  @override
  List<Object> get props => [polyLines, latLngBounds];
}

class ClearPolyLines extends PolyLineState {}
