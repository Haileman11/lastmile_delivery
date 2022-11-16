import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/common/app_dialog.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';

import '../blocs/driver_profile/driver_profile_bloc.dart';
import '../blocs/socket/socket_bloc.dart';

class StatusSwitchWidget extends StatelessWidget {
  const StatusSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<SocketBloc, SocketState>(
            builder: (context, state) {
              if (state is SocketConnecting) {
                return const Text('connecting...');
              }

              if (state is SocketDisconnected || state is SocketInitial) {
                return const Text('Tap to become online');
              }

              if (state is SocketError || state is SocketConnectionTimedOut) {
                return Text(
                  'Connection failed, try again.',
                  style: TextStyle(color: AppColors.errorRed),
                );
              }
              return const SizedBox();
            },
          ),
          BlocBuilder<DriverProfileBloc, DriverProfileState>(
            builder: (context, state) {
              final socketState = BlocProvider.of<SocketBloc>(context).state;
              if (state is DriverProfileLoaded &&
                  socketState is SocketConnected) {
                if (state.driverProfile.isAvailable) {
                  return Text(
                    'Available',
                    style: TextStyle(color: AppColors.appGreen),
                  );
                }
              }

              return const SizedBox();
            },
          ),
          BlocBuilder<DriverProfileBloc, DriverProfileState>(
            builder: (context, state) {
              return Switch(
                key: const Key("AVAILABILITY_SWITCH"),
                value: state is DriverProfileLoaded &&
                    state.driverProfile.isAvailable,
                activeColor: AppColors.appGreen,
                onChanged: (value) {
                  if (value) {
                    context.read<SocketBloc>().add(SocketConnect());
                  } else {
                    final globalContext = context;
                    showDialog(
                        context: context,
                        builder: (context) {
                          /// STOP UPDATING DRIVER LOCATION
                          BlocProvider.of<UpdateLocationBloc>(context)
                              .add(const StopUpdatingLocation());
                          return AppDialog(
                            optionTitle: 'Go offline',
                            message:
                                'You won\'t receive any orders while offline.',
                            onTap: () {
                              globalContext.read<DriverProfileBloc>().add(
                                  const UpdateDriverAvailabilityEvent(
                                      isAvailable: false));
                              Navigator.pop(context);
                            },
                          );
                        });
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
