import 'package:lastmile_mobile/src/data/models/order.dart';

List<OrderModel> mockOrders = [
  OrderModel.fromMap({
    'id': 'id',
    'businessCustomerName': "Boss burger",
    'orderCategory': 'singleToSingle',
    'orderStatus': 'delivered',
    'orderType': 'ondemand',
    'serviceTypeName': "FOOD",
    'estimatedTripDistance': 3.4,
    'estimatedPrice': 5.4,
    'estimatedTime': 5.4,
    'pickupTasks': [
      {
        'id': '1',
        "address": "Kazanchis, Addis Ababa",
        'location': {"lat": 9.019138, "lng": 38.801672},
        'responsiblePersonName': "Abaeb",
        'responsiblePersonPhone': "_234243",
        'status': 'pending',
        'taskType': 'pickup'
      }
    ],
    'dropoffTasks': [
      {
        'id': '2',
        'address': "Bole, Addis Ababa",
        'location': {"lat": 8.989743, "lng": 38.794538},
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
  }),
  OrderModel.fromMap({
    'id': 'id',
    'businessCustomerName': "Boss burger",
    'orderCategory': 'singleToSingle',
    'orderStatus': 'cancelled',
    'orderType': 'ondemand',
    'serviceTypeName': "FOOD",
    'estimatedTripDistance': 3.4,
    'estimatedPrice': 5.4,
    'estimatedTime': 5.4,
    'pickupTasks': [
      {
        'id': '1',
        "address": "Kazanchis, Addis Ababa",
        'location': {"lat": 9.019138, "lng": 38.801672},
        'responsiblePersonName': "Abaeb",
        'responsiblePersonPhone': "_234243",
        'status': 'pending',
        'taskType': 'pickup'
      }
    ],
    'dropoffTasks': [
      {
        'id': '2',
        'address': "Bole, Addis Ababa",
        'location': {"lat": 8.989743, "lng": 38.794538},
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
  }),
  OrderModel.fromMap({
    'id': 'id',
    'businessCustomerName': "Boss burger",
    'orderCategory': 'singleToSingle',
    'orderStatus': 'transferred',
    'orderType': 'ondemand',
    'serviceTypeName': "FOOD",
    'estimatedTripDistance': 3.4,
    'estimatedPrice': 5.4,
    'estimatedTime': 5.4,
    'pickupTasks': [
      {
        'id': '1',
        "address": "Kazanchis, Addis Ababa",
        'location': {"lat": 9.019138, "lng": 38.801672},
        'responsiblePersonName': "Abaeb",
        'responsiblePersonPhone': "_234243",
        'status': 'pending',
        'taskType': 'pickup'
      }
    ],
    'dropoffTasks': [
      {
        'id': '2',
        'address': "Bole, Addis Ababa",
        'location': {"lat": 8.989743, "lng": 38.794538},
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
  }),
  OrderModel.fromMap({
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
        'location': {"lat": 9.019138, "lng": 38.801672},
        'responsiblePersonName': "Abaeb",
        'responsiblePersonPhone': "_234243",
        'status': 'pending',
        'taskType': 'pickup'
      }
    ],
    'dropoffTasks': [
      {
        'id': '2',
        'address': "Bole, Addis Ababa",
        'location': {"lat": 8.989743, "lng": 38.794538},
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
  }),
];

const transactions = [
  {
    'id': '1',
    'transactionType': 'earned',
    'amount': 1000.00,
    'from': 'Boss burger',
    'to': 'Abebe',
    'createdAt': '2022-12-05T11:54:42+00:00'
  },
  {
    'id': '2',
    'transactionType': 'earned',
    'amount': 2000.00,
    'from': 'Nunya',
    'to': 'Business',
    'createdAt': '2022-12-05T11:54:42+00:00'
  },
  {
    'id': '3',
    'transactionType': 'earned',
    'amount': 2000.00,
    'from': 'Mischievous',
    'to': 'Deceitful',
    'createdAt': '2022-12-05T11:54:42+00:00'
  },
  {
    'id': '4',
    'transactionType': 'earned',
    'amount': 2000.00,
    'from': 'Chicanerous',
    'to': 'Deplorable',
    'createdAt': '2022-12-05T11:54:42+00:00'
  },
];
