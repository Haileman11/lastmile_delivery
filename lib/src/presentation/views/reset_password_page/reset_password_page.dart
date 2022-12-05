import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';
import 'package:lastmile_mobile/src/presentation/common/app_text_field.dart';
import 'package:lastmile_mobile/src/presentation/common/submit_button.dart';

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
    return Scaffold(
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
                key: const Key('confirm_password_controller'),
                controller: confirmPasswordController,
                labelText: 'Confirm New Password',
                isPassword: true,
              ),
              const SizedBox(height: 50.0),
              AppSubmitButton(
                onTap: () {},
                title: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
