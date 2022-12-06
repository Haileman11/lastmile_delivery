import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';
import 'package:lastmile_mobile/src/presentation/common/app_snack_bar.dart';
import 'package:lastmile_mobile/src/presentation/common/app_text_field.dart';
import 'package:lastmile_mobile/src/presentation/common/submit_button.dart';
import 'package:lastmile_mobile/src/presentation/views/login_page/widgets/create_account_button.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/widgets/country_code_picker_modal.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  /// PHONE NUMBER CONTROLLER
  final TextEditingController phoneNumberController = TextEditingController();

  /// SELECTED COUNTRY CODE
  CountryCode selectedCountryCode = CountryCode.fromCountryCode('ET');

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      color: AppColors.white,
                      padding: const EdgeInsets.only(top: 35.0),
                      child: Center(
                        child: Image.asset(
                          'assets/images/delivery_on_login.png',
                          fit: BoxFit.cover,
                          height:
                              ScreenUtil(context: context).getScreenHeight() *
                                  0.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 65.0),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CountryPickerModal(
                                onChangedCallback: (CountryCode? countryCode) {
                                  selectedCountryCode = countryCode!;
                                },
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: AppTextField(
                                  key: const Key('phone_number_field'),
                                  controller: phoneNumberController,
                                  labelText: '9********',
                                  isNumber: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35.0),
                          AppSubmitButton(
                            key: const Key('LOGIN_BUTTON'),
                            onTap: () {
                              if (phoneNumberController.text.trim().isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  buildAppSnackBar(
                                    key: 'error_message',
                                    bgColor: AppColors.errorRed,
                                    txtColor: AppColors.white,
                                    msg: 'Please enter your phone number',
                                    isFloating: false,
                                  ),
                                );
                              } else {
                                NavigationService.instance.navigateToWithArgs(
                                    AppRoutes.podPageRoute, context, {
                                  'isLogin': true,
                                  'phoneNumber': selectedCountryCode.dialCode!
                                          .replaceAll('+', '') +
                                      phoneNumberController.text.trim(),
                                });
                              }
                            },
                            title: 'Login',
                          ),
                          const SizedBox(height: 25.0),
                          const CreateAccountButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
