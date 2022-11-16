import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';

import '../blocs/driver_profile/driver_profile_bloc.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverProfileBloc, DriverProfileState>(
      builder: (context, state) {
        if (state is DriverProfileLoaded) {
          return Container(
            key: const Key('DRIVER_INFO_PAGE'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                    margin: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.center,
                              child: Text(
                                '${state.driverProfile.name}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InformationWidget(
                              caption: "Jobs Last Month", value: "10"),
                        ),
                        Expanded(
                          child: InformationWidget(
                              caption: "Rating", value: "4.5"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is DriverProfileLoading) {
          return CircularProgressIndicator();
        } else {
          return Container(
            child: Text("Error loading profile"),
          );
        }
      },
    );
  }
}

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    Key? key,
    required this.caption,
    required this.value,
  }) : super(key: key);

  final String caption;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(caption, style: Theme.of(context).textTheme.caption),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
