import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/google_maps_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/status_switch_widget.dart';

import 'blocs/order/order_bloc.dart';
import 'widgets/order_request.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(">>BUILLDER ");
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          PhosphorIcons.list_light,
          color: AppColors.white,
        ),
        elevation: 0.0,
        backgroundColor: AppColors.appBlack,
        title: Text(
          'Delivery',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        actions: [
          Icon(
            PhosphorIcons.bell_fill,
            color: AppColors.white,
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Expanded(child: MapView()),
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  if (state is OrderAssigned) {
                    BlocProvider.of<PolyLineBloc>(context).add(
                      DecodePolyLineEvent(
                        state.order!.route.encodedPolyline,
                        state.order!.route.bounds,
                        state.order!.dropoffTasks
                            .map(
                              (e) => Marker(
                                  markerId: MarkerId("${e.id}"),
                                  position: e.location),
                            )
                            .toSet(),
                      ),
                    );
                  }

                  return Offstage(
                    child: state is! OrderAssigned
                        ? Container()
                        : OrderRequest(order: state.order!),
                    offstage: state is! OrderAssigned,
                  );
                },
              )
            ],
          ),
          StatusSwitchWidget(),
        ],
      ),
    );
  }
}
