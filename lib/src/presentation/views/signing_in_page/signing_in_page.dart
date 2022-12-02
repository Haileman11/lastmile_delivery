import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';
import 'package:lastmile_mobile/src/presentation/common/app_error.dart';
import 'package:lastmile_mobile/src/presentation/common/app_loading.dart';
import 'package:lastmile_mobile/src/presentation/views/login_page/blocs/login/login_bloc.dart';

class SigningInPage extends StatelessWidget {
  const SigningInPage({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginDone) {
            NavigationService.instance.navigateNamedAndRemoveUntil(
              AppRoutes.homePageRoute,
              AppRoutes.splashScreenRoute,
              context,
            );
          }

          if (state is LoginError) {
            print(state.errorMessage);
          }
        },
        child: Center(
          child: buildLoading(),
        ),
      ),
    );
  }

  buildLoading() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppLoading(size: 70.0, strokeWidth: 5.0),
              const SizedBox(height: 20.0),
              Text(
                'Signing in...',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: AppFontSizes.font_size_16,
                ),
              ),
            ],
          );
        }

        if (state is LoginError) {
          return AppError(onTap: () {
            BlocProvider.of<LoginBloc>(context).add(
              LoginDriver(phoneNumber),
            );
          });
        }

        return const SizedBox();
      },
    );
  }
}
