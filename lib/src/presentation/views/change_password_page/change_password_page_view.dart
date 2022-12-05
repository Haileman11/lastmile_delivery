import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';
import 'package:lastmile_mobile/src/presentation/common/app_snack_bar.dart';
import 'package:lastmile_mobile/src/presentation/common/app_text_field.dart';
import 'package:lastmile_mobile/src/presentation/common/submit_button.dart';
import 'package:lastmile_mobile/src/presentation/views/change_password_page/blocs/change_password/change_password_bloc.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  /// CONTROLLERS
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBlack,
        automaticallyImplyLeading: true,
        systemOverlayStyle: getStatusBarStyle().copyWith(
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          'Change password',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordDone) {
            ScaffoldMessenger.of(context).showSnackBar(
              buildAppSnackBar(
                bgColor: AppColors.appBlack,
                txtColor: AppColors.white,
                msg: 'Password updated successfully',
                isFloating: false,
              ),
            );
            Navigator.pop(context);
          }

          if (state is ChangePasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              buildAppSnackBar(
                key: 'error_message',
                bgColor: AppColors.errorRed,
                txtColor: AppColors.white,
                msg: 'Something went wrong, try again',
                isFloating: false,
              ),
            );
          }
        },
        child: SingleChildScrollView(
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
                  key: const Key('old_password_field'),
                  controller: oldPasswordController,
                  isPassword: true,
                  labelText: 'Old password *',
                ),
                const SizedBox(height: 25.0),
                AppTextField(
                  key: const Key('new_password_field'),
                  controller: newPasswordController,
                  isPassword: true,
                  labelText: 'New password *',
                ),
                const SizedBox(height: 25.0),
                AppTextField(
                  key: const Key('confirm_password_field'),
                  controller: confirmNewPasswordController,
                  isPassword: true,
                  labelText: 'Confirm new password *',
                ),
                const SizedBox(height: 45.0),
                BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                  builder: (context, state) {
                    if (state is ChangePasswordLoading) {
                      return AppSubmitButton(
                        onTap: () {},
                        title: 'Changing Password',
                        isLoading: true,
                      );
                    }

                    return AppSubmitButton(
                        onTap: () {
                          if (oldPasswordController.text.trim().isEmpty ||
                              newPasswordController.text.trim().isEmpty ||
                              confirmNewPasswordController.text
                                  .trim()
                                  .isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              buildAppSnackBar(
                                key: 'error_message',
                                bgColor: AppColors.errorRed,
                                txtColor: AppColors.white,
                                msg: 'Please fill all required fields',
                                isFloating: false,
                              ),
                            );
                          } else if (newPasswordController.text.trim() !=
                              confirmNewPasswordController.text.trim()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              buildAppSnackBar(
                                key: 'error_message',
                                bgColor: AppColors.errorRed,
                                txtColor: AppColors.white,
                                msg: 'Confirm doesn\'t match new password',
                                isFloating: false,
                              ),
                            );
                          } else {
                            BlocProvider.of<ChangePasswordBloc>(context)
                                .add(ChangePassword(
                              oldPasswordController.text.trim(),
                              newPasswordController.text.trim(),
                            ));
                          }
                        },
                        title: 'Change Password');
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
