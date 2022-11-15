part of 'polyline_bloc.dart';

abstract class PolyLineEvent extends Equatable {
  const PolyLineEvent();

  @override
  List<Object> get props => [];
}

class DecodePolyLineEvent extends PolyLineEvent {
  final String encodedPolyLine;
  final LatLngBounds latLngBounds;
  final Set<Marker> markers;

  const DecodePolyLineEvent(
      this.encodedPolyLine, this.latLngBounds, this.markers);
}

class ClearPolyLinesEvent extends PolyLineEvent {
  const ClearPolyLinesEvent();
}
