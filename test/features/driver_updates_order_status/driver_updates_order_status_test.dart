import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/task/task_bloc.dart';

import '../../utils/test_injector.dart';

Future<void> main() async {
  group('''Driver updates order status''', () {
    setUpAll(() async {
      await initializeTestDependencies();
    });

    tearDownAll(() async {
      injector.reset();
    });

    var order = OrderModel.fromMap({
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
        },
        {
          'id': '2',
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
        },
        {
          'id': '2',
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
      'the driver updates task state to heading-to-pickup.',
      build: () => TaskBloc(injector()),
      act: (bloc) => bloc.add(HeadingForPickupEvent(order.pickupTasks.first)),
      expect: () => [TaskHeadingToPickup(order.pickupTasks.first)],
    );
    blocTest(
      'when the driver reaches pickup location, fires task arrive-to-pickup event which emits the waiting for package state.',
      build: () => TaskBloc(injector()),
      act: (bloc) => bloc.add(ArriveToPickupEvent(order.pickupTasks.first)),
      expect: () => [TaskWaitingForPackage(order.pickupTasks.first)],
    );
    blocTest(
      'fires complete-pickup event which updates the task state to pickup-complete.',
      build: () => TaskBloc(injector()),
      act: (bloc) => bloc.add(CompletePickupEvent(order.pickupTasks.first)),
      expect: () => [TaskPickupComplete(order.pickupTasks.first)],
    );
    blocTest(
      'triggers the order pickup-complete-event which starts the next pickup task',
      build: () => OrderBloc(injector(), injector()),
      act: (bloc) =>
          bloc.add(OrderPickUpCompleteEvent(order, order.pickupTasks.first)),
      expect: () => [
        OrderPickedUp(order),
        OrderHeadingForPickup(order, order.pickupTasks[1])
      ],
    );
    blocTest(
      'If there are no pickup tasks, heading-to-dropoff state will be emitted.',
      build: () => OrderBloc(injector(), injector()),
      act: (bloc) =>
          bloc.add(OrderPickUpCompleteEvent(order, order.pickupTasks.last)),
      expect: () => [
        OrderPickedUp(order),
        OrderHeadingForDropoff(order, order.pickupTasks[1])
      ],
    );
    //dropoff
    blocTest(
      'the driver updates task state to heading-to-dropoff.',
      build: () => TaskBloc(injector()),
      act: (bloc) => bloc.add(HeadingForDropoffEvent(order.dropoffTasks.first)),
      expect: () => [TaskHeadingToDropoff(order.dropoffTasks.first)],
    );
    blocTest(
      'when the driver reaches dropoff location, fires task arrive-to-dropoff event which emits the waiting for confirmation state.',
      build: () => TaskBloc(injector()),
      act: (bloc) => bloc.add(ArriveToDropoffEvent(order.dropoffTasks.first)),
      expect: () => [TaskWaitingForConfirmation(order.dropoffTasks.first)],
    );
    blocTest(
      'fires complete-dropoff event which updates the task state to dropoff-complete.',
      build: () => TaskBloc(injector()),
      act: (bloc) => bloc.add(CompleteDropoffEvent(order.dropoffTasks.first)),
      expect: () => [TaskDropoffComplete(order.dropoffTasks.first)],
    );
    blocTest(
      'triggers the order dropoff-complete-event which starts the next dropoff task',
      build: () => OrderBloc(injector(), injector()),
      act: (bloc) =>
          bloc.add(OrderDropoffCompleteEvent(order, order.dropoffTasks.first)),
      expect: () => [
        OrderDroppedOff(order),
        OrderHeadingForDropoff(order, order.dropoffTasks[1])
      ],
    );

    blocTest(
      'verifies order drop off with POD',
      build: () => TaskBloc(injector()),
      act: (bloc) =>
          bloc.add(TaskDropOffVerifySuccessEvent(order.dropoffTasks[1])),
      expect: () => [
        TaskDropOffVerifySuccessState(order.dropoffTasks[1]),
      ],
    );

    blocTest(
      'fails to verify order drop off with POD',
      build: () => TaskBloc(injector()),
      act: (bloc) =>
          bloc.add(TaskDropOffVerifyFailedEvent(order.dropoffTasks[1])),
      expect: () => [
        TaskDropOffVerifyFailedState(order.dropoffTasks[1]),
      ],
    );

    blocTest(
      'If there are no dropoff tasks, order complete state will be emitted.',
      build: () => OrderBloc(injector(), injector()),
      act: (bloc) =>
          bloc.add(OrderDropoffCompleteEvent(order, order.dropoffTasks.last)),
      expect: () => [OrderDroppedOff(order), OrderCompleted(order)],
    );
    blocTest(
      'complete order event changes the state to order unassigned.',
      build: () => OrderBloc(injector(), injector()),
      act: (bloc) => bloc.add(OrderCompleteEvent(
        order,
      )),
      expect: () => [const OrderUnassigned()],
    );
  });
}
