import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';

import '../../utils/test_injector.dart';

Future<void> main() async {
  group('''Driver accepts order''', () {
    var order = Order.fromMap({
      'id': 'id',
      'businessCustomerName': "Boss burger",
      'orderCategory': 'singleToSingle',
      'orderStatus': 'unassigned',
      'orderType': 'ondemand',
      'serviceTypeName': "FOOD",
      'estimatedTripDistance': 3.4,
      'estimatedPrice': 5.4,
      'estimatedTime': 5.4,
      'pickupTasks': [
        {
          'id': '1',
          "address": "Kazanchis, Addis Ababa",
          'location': {"lat": 42.3599162, "lng": -71.3496743},
          'responsiblePersonName': "Abaeb",
          'responsiblePersonPhone': "_234243",
          'status': 'pending',
          'taskType': 'pickup'
        }
      ],
      'dropoffTasks': [
        {
          'id': '1',
          'address': "Bole, Addis Ababa",
          'location': {"lat": 42.3599162, "lng": -71.3496743},
          'responsiblePersonName': "Abaeb",
          'responsiblePersonPhone': "_234243",
          'status': 'pending',
          'taskType': 'dropoff'
        }
      ],
      'route': {
        "encodedPolyline":
            'olpaGj{upLwAdAi@l@m@bASd@Qd@QKW]GIo@}A{DcK{AaGi@q@UGYd@mBtBoAbAa@f@o@DKFkAH}DHaDJYN}@x@sA`Ak@jAi@`AqBlAyFzCgAPm@\\k@b@]FaALuJmOmCaDyEgGoCqEu@y@w@{@KX]r@yA|Cc@dCaEnPsFjT{Nr^gI~S{@tB}AhAMJq@Nm@Go@@OJUXMv@B`@`@t@|@ZLd@Cr@iBbFs@dBoJtL}O`UmAjB{A|A_@n@yAnAaAt@mEvDcAhAuCpEkAhBu@bBuExG{FpIgMlQaFnFoE|DwRpPsN`M_EjDY?sAr@eCv@cAJ{CKoF_@wA?m@LmBbA}@hAy@tB}BhLsAtD}JfPwA`Ew@rDg@rBq@zAuAfCs@pDm@jB_@t@_ArCSrCSzM]|UJ`HArGHlB`@vCf@bBn@hAp@v@PDVF^ZPx@b@fBnAxC~AhCvAjBlBdB`D~Cd@~@TVPAFIZUt@OdCD|@I|Bk@dCOfCHhAGvBa@|Ba@|@B~@^t@l@pAnBnBrE`B`C~ClCtAl@|BZxJKvBHp@Vt@l@fCfCfCxBpBxBt@rA^vA^~EZzEb@dBjBvC~BrB~@tCFb@]jC}@hEqEfTkJjc@yGjQgG`MwAvCy@`CmE`UkDdQ{GxVoFrTsDpSoAvLyBbTaAvFeBjH{C~LgDvLyGjT}BpK{Ft\\cAhKg@lIi@rZ_@|Pg@lJq@~HaBxLyArH{CbLuCjJsApGs@dGUzDSbJCdDMZ?BYjE[|DWbDM\\o@l@uAFo@EgAAo@GuCUaE[sGe@{BO_BAyBh@kFtBeJpFyDzBkDdA{MhC{Jv@aAOmAaAwCyCcAq@o@UsA_@uA{@iA{@iAyAcDkEoEmEqDuCqAy@gG}A{@c@uCgC{AsA][g@nA}@rBwAdD_AtBg@jAAh@yBzIQbEZpQ`D|W~@zHfArFXlCAbFLnCbBrJFrAIjCXrFAtG^lJQ~EUnFj@`IbAxDxAnEVpBE|D_@tHHhB~@xB\\h@wAtBu@dAoDdFa@`Ag@jC_AzI}AvSi@pG[tIi@lTPhD`@fEN`NFvT@fCQhBeBvGgFzKkBdG_@vBWdDg@vGsAjRiDpf@eBxd@}AhGmEdJyBzG_BfDmFlJiBjFYdBOtDOfBs@hD{D`Nu@~C[hEZbGU~JB`FVvGr@nIf@`IHpEV`Cl@fDPnCVbJj@zKCzBu@tKc@zD{@fE{BnD_A~Am@hBmAvCk@Zk@h@kBtAi@`@Tx@jBmAx@m@RW',
        "bounds": {
          "northeast": {'lat': 42.4614275, 'lng': -71.0552091},
          "southwest": {"lat": 42.3599162, "lng": -71.3496743}
        }
      },
    });
    blocTest(
      'Driver accepts order',
      build: () => OrderBloc(injector(), injector()),
      act: (bloc) => bloc.add(OrderAcceptedEvent(order)),
      expect: () => [OrderHeadingForPickup(order, order.pickupTasks.first)],
    );

    setUpAll(() async {
      await initializeTestDependencies();
      await AppHiveService.instance.initHiveBoxes();
    });

    tearDownAll(() async {
      injector.reset();
      await AppHiveService.instance.driverBox.close();
    });
  });
}
