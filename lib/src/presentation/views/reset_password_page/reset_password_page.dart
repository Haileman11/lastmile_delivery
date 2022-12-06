import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';
import 'package:lastmile_mobile/src/presentation/common/app_snack_bar.dart';
import 'package:lastmile_mobile/src/presentation/common/app_text_field.dart';
import 'package:lastmile_mobile/src/presentation/common/submit_button.dart';
import 'package:lastmile_mobile/src/presentation/views/reset_password_page/blocs/reset_password/reset_password_bloc.dart';

class ResetPasswordPageView extends StatefulWidget {
  const ResetPasswordPageView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPageView> createState() => _ResetPasswordPageViewState();
}

class _ResetPasswordPageViewState extends State<ResetPasswordPageView> {
  /// CONTROLLERS
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildAppSnackBar(
              bgColor: AppColors.errorRed,
              txtColor: AppColors.white,
              msg: 'Something went wrong, try again',
              isFloating: false,
            ),
          );
        }

        if (state is ResetPasswordDone) {
          NavigationService.instance.navigateNamedAndRemoveUntil(
              AppRoutes.homePageRoute, AppRoutes.splashScreenRoute, context);
          ScaffoldMessenger.of(context).showSnackBar(
            buildAppSnackBar(
              bgColor: AppColors.appBlack,
              txtColor: AppColors.white,
              msg: 'Password reset Successful',
              isFloating: false,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          systemOverlayStyle: getStatusBarStyle().copyWith(
            statusBarIconBrightness: Brightness.light,
          ),
          title: Text(
            'Reset Password',
            style: TextStyle(color: AppColors.white),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  height: ScreenUtil(context: context).getScreenHeight() * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.asset(
                        'assets/images/change_password_header.png',
                      ).image,
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                AppTextField(
                  key: const Key('new_password_field'),
                  controller: newPasswordController,
                  labelText: 'New Password',
                  isPassword: true,
                ),
                const SizedBox(height: 25.0),
                AppTextField(
                  key: const Key('confirm_password_field'),
                  controller: confirmPasswordController,
                  labelText: 'Confirm New Password',
                  isPassword: true,
                ),
                const SizedBox(height: 50.0),
                BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                  builder: (context, state) {
                    if (state is ResetPasswordLoading) {
                      return AppSubmitButton(
                        onTap: () {},
                        title: 'Resetting...',
                        isLoading: true,
                      );
                    }

                    return AppSubmitButton(
                      key: const Key('RESET_PASSWORD'),
                      onTap: () {
                        if (newPasswordController.text.trim().isEmpty ||
                            confirmPasswordController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            buildAppSnackBar(
                              bgColor: AppColors.errorRed,
                              txtColor: AppColors.white,
                              msg: 'please fill all required fields',
                              isFloating: false,
                            ),
                          );
                        } else if (newPasswordController.text.trim() !=
                            confirmPasswordController.text.trim()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            buildAppSnackBar(
                              bgColor: AppColors.errorRed,
                              txtColor: AppColors.white,
                              msg:
                                  'confirmed password doesn\'t match new password',
                              isFloating: false,
                            ),
                          );
                        } else {
                          BlocProvider.of<ResetPasswordBloc>(context).add(
                              ResetPassword(newPasswordController.text.trim()));
                        }
                      },
                      title: 'Continue',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
