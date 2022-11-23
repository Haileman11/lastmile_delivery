import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';

import '../../utils/test_injector.dart';

Future<void> main() async {
  final encodedPolyLine =
      'olpaGj{upLwAdAi@l@m@bASd@Qd@QKW]GIo@}A{DcK{AaGi@q@UGYd@mBtBoAbAa@f@o@DKFkAH}DHaDJYN}@x@sA`Ak@jAi@`AqBlAyFzCgAPm@\\k@b@]FaALuJmOmCaDyEgGoCqEu@y@w@{@KX]r@yA|Cc@dCaEnPsFjT{Nr^gI~S{@tB}AhAMJq@Nm@Go@@OJUXMv@B`@`@t@|@ZLd@Cr@iBbFs@dBoJtL}O`UmAjB{A|A_@n@yAnAaAt@mEvDcAhAuCpEkAhBu@bBuExG{FpIgMlQaFnFoE|DwRpPsN`M_EjDY?sAr@eCv@cAJ{CKoF_@wA?m@LmBbA}@hAy@tB}BhLsAtD}JfPwA`Ew@rDg@rBq@zAuAfCs@pDm@jB_@t@_ArCSrCSzM]|UJ`HArGHlB`@vCf@bBn@hAp@v@PDVF^ZPx@b@fBnAxC~AhCvAjBlBdB`D~Cd@~@TVPAFIZUt@OdCD|@I|Bk@dCOfCHhAGvBa@|Ba@|@B~@^t@l@pAnBnBrE`B`C~ClCtAl@|BZxJKvBHp@Vt@l@fCfCfCxBpBxBt@rA^vA^~EZzEb@dBjBvC~BrB~@tCFb@]jC}@hEqEfTkJjc@yGjQgG`MwAvCy@`CmE`UkDdQ{GxVoFrTsDpSoAvLyBbTaAvFeBjH{C~LgDvLyGjT}BpK{Ft\\cAhKg@lIi@rZ_@|Pg@lJq@~HaBxLyArH{CbLuCjJsApGs@dGUzDSbJCdDMZ?BYjE[|DWbDM\\o@l@uAFo@EgAAo@GuCUaE[sGe@{BO_BAyBh@kFtBeJpFyDzBkDdA{MhC{Jv@aAOmAaAwCyCcAq@o@UsA_@uA{@iA{@iAyAcDkEoEmEqDuCqAy@gG}A{@c@uCgC{AsA][g@nA}@rBwAdD_AtBg@jAAh@yBzIQbEZpQ`D|W~@zHfArFXlCAbFLnCbBrJFrAIjCXrFAtG^lJQ~EUnFj@`IbAxDxAnEVpBE|D_@tHHhB~@xB\\h@wAtBu@dAoDdFa@`Ag@jC_AzI}AvSi@pG[tIi@lTPhD`@fEN`NFvT@fCQhBeBvGgFzKkBdG_@vBWdDg@vGsAjRiDpf@eBxd@}AhGmEdJyBzG_BfDmFlJiBjFYdBOtDOfBs@hD{D`Nu@~C[hEZbGU~JB`FVvGr@nIf@`IHpEV`Cl@fDPnCVbJj@zKCzBu@tKc@zD{@fE{BnD_A~Am@hBmAvCk@Zk@h@kBtAi@`@Tx@jBmAx@m@RW';

  final driverPolyLine =
      'qp|u@shvkFA?SMV]^a@RSDGZ[TSBCJK\\YFCHEJU?G?ECMGKIGCAGCM?M@KFCDEFUOc@O}Ac@SGoA_@sA]QGo@Qw@Wc@OyAa@IC}@Wy@Ug@OcBi@gGeB}@YcAWu@Oi@IUCY@k@F]FC@OD]Fk@Jk@Hg@Hw@Lm@JI@g@HqB^c@Hs@J{B\\eAP_ANi@Fo@Jc@H]DwAPeC^K@_BP}BZgANM@sBX]CiGPu@A]Ac@GEKEKQMKAI?UBIDIHGJg@QsAq@wAw@w@o@{@y@e@_@eAs@kAo@wBeAkA{@e@c@W]S_@Q[Ym@_@m@QWKUw@kAa@o@]_@KMHiDDoA?S@ED}AP{BBg@@WT}DDi@Bo@h@D^Bv@J@c@d@?h@A`@AXE`AOt@SpB[f@~Bc@H';

  final List<PointLatLng> decodeResult =
      PolylinePoints().decodePolyline(encodedPolyLine);

  final List<PointLatLng> driverDecodeResult =
      PolylinePoints().decodePolyline(driverPolyLine);

  List<LatLng> points = [];
  for (var pointLatLng in decodeResult) {
    points.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
  }

  List<LatLng> driverPoints = [];
  for (var pointLatLng in driverDecodeResult) {
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

  group('''Driver gets optimized route''', () {
    setUpAll(() async {
      await initializeTestDependencies();
    });

    tearDownAll(() async {
      injector.reset();
    });

    blocTest(
      'Driver becomes online',
      build: () => PolyLineBloc(),
      act: (bloc) => bloc.add(DecodePolyLineEvent(
          encodedPolyLine,
          driverPolyLine,
          LatLngBounds(
              northeast: LatLng(42.4614275, -71.0552091),
              southwest: LatLng(42.3599162, -71.3496743)),
          {})),
      expect: () => [
        DecodingSuccess(
            polyLines,
            LatLngBounds(
                northeast: LatLng(42.4614275, -71.0552091),
                southwest: LatLng(42.3599162, -71.3496743)),
            {})
      ],
    );
  });
}
