import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

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
              return Text(state.toString());
            },
          ),
          BlocBuilder<DriverProfileBloc, DriverProfileState>(
            builder: (context, state) {
              return Text(state.toString());
            },
          ),
          BlocConsumer<DriverProfileBloc, DriverProfileState>(
            listener: (context, state) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.toString())));
            },
            builder: (context, state) {
              return Switch(
                value: state is DriverProfileLoaded &&
                    state.driverProfile.isAvailable,
                onChanged: (value) {
                  if (value) {
                    context.read<SocketBloc>().add(SocketConnect());
                  } else {
                    context.read<DriverProfileBloc>().add(
                        const UpdateDriverAvailabilityEvent(
                            isAvailable: false));
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
