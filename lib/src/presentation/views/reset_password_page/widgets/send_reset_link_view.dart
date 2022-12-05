import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/common/app_loading.dart';
import 'package:lastmile_mobile/src/presentation/views/reset_password_page/blocs/send_reset_link/send_reset_link_bloc.dart';

class SendResetLinkView extends StatelessWidget {
  const SendResetLinkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: getStatusBarStyle().copyWith(
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          'Send Link',
          style: TextStyle(color: AppColors.white),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        width: double.infinity,
        child: BlocBuilder<SendResetLinkBloc, SendResetLinkState>(
          builder: (context, state) {
            if (state is SendResetLinkDone) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Check your email for a password reset link.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppFontSizes.font_size_22,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: AppColors.appGreen,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Go to mail',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              );
            }

            if (state is SendResetLinkError) {
              return GestureDetector(
                onTap: () {
                  final driverId = injector<DriverModel>().id;
                  BlocProvider.of<SendResetLinkBloc>(context)
                      .add(SendResetLink(driverId));
                },
                child: Center(
                  child: Text('Something went wrong.\nTry again.'),
                ),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                AppLoading(size: 52),
                SizedBox(height: 25.0),
                Text(
                  'Sending reset link...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppFontSizes.font_size_22,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
