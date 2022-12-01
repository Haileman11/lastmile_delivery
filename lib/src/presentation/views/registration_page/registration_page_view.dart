import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/params/request_params.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';
import 'package:lastmile_mobile/src/presentation/common/app_dialog.dart';
import 'package:lastmile_mobile/src/presentation/common/app_snack_bar.dart';
import 'package:lastmile_mobile/src/presentation/common/app_text_field.dart';
import 'package:lastmile_mobile/src/presentation/common/submit_button.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/image_upload/image_upload_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/register/register_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/widgets/image_picker_widget.dart';

import 'widgets/country_code_picker_modal.dart';

class RegistrationPageView extends StatefulWidget {
  const RegistrationPageView({Key? key}) : super(key: key);

  @override
  State<RegistrationPageView> createState() => _RegistrationPageViewState();
}

class _RegistrationPageViewState extends State<RegistrationPageView> {
  /// CONTROLLERS
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();

  /// SELECTED COUNTRY CODE
  CountryCode selectedCountryCode = CountryCode.fromCountryCode('ET');

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterDone) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildAppSnackBar(
              bgColor: AppColors.black,
              txtColor: AppColors.white,
              msg: 'Confirm your phone number',
              isFloating: false,
            ),
          );
          NavigationService.instance.navigateToWithArgs(
              AppRoutes.podPageRoute, context, {'isOtp': true});
        }

        if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildAppSnackBar(
              bgColor: AppColors.errorRed,
              txtColor: AppColors.white,
              msg: 'Registration failed, try again',
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
            'Sign-up',
            style: TextStyle(color: AppColors.white),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.padding_14,
              vertical: AppPadding.padding_18,
            ),
            child: Column(
              children: [
                const UserImageWidget(),
                const SizedBox(height: 28.0),
                AppTextField(
                    key: const Key('first_name_field'),
                    controller: firstNameController,
                    labelText: 'First Name *'),
                const SizedBox(height: 25.0),
                AppTextField(
                    key: const Key('last_name_field'),
                    controller: lastNameController,
                    labelText: 'Last Name *'),
                const SizedBox(height: 28.0),
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
                const SizedBox(height: 28.0),
                AppTextField(
                  key: const Key('email_field'),
                  controller: emailController,
                  labelText: 'Email *',
                  isEmail: true,
                ),
                const SizedBox(height: 25.0),
                AppTextField(
                  key: const Key('password_field'),
                  controller: passwordController,
                  labelText: 'Password *',
                  isPassword: true,
                ),
                const SizedBox(height: 38.0),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return AppSubmitButton(
                        onTap: () {},
                        title: 'Signing up...',
                        isLoading: true,
                      );
                    }

                    return AppSubmitButton(
                      key: const Key('REGISTER_BUTTON'),
                      onTap: _onSubmit,
                      title: 'Sign up',
                      isLoading: false,
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

  _onSubmit() {
    if (BlocProvider.of<ImageUploadBloc>(context).state is! ImageUploadDone) {
      showDialog(
          context: context,
          builder: (context) {
            return AppDialog(
              onTap: () {
                Navigator.pop(context);
              },
              optionTitle: 'Okay',
              message: 'Please pick an image',
              isConfirm: true,
            );
          });
    } else if (firstNameController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AppDialog(
              onTap: () {
                Navigator.pop(context);
              },
              optionTitle: 'Okay',
              message: 'Please fill in first name',
              isConfirm: true,
            );
          });
    } else if (lastNameController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AppDialog(
              onTap: () {
                Navigator.pop(context);
              },
              optionTitle: 'Okay',
              message: 'Please fill in your last name',
              isConfirm: true,
            );
          });
    } else if (phoneNumberController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AppDialog(
              onTap: () {
                Navigator.pop(context);
              },
              optionTitle: 'Okay',
              message: 'Please fill in your phone',
              isConfirm: true,
            );
          });
    } else if (emailController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AppDialog(
              onTap: () {
                Navigator.pop(context);
              },
              optionTitle: 'Okay',
              message: 'Please fill in your email',
              isConfirm: true,
            );
          });
    } else if (passwordController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AppDialog(
              onTap: () {
                Navigator.pop(context);
              },
              optionTitle: 'Okay',
              message: 'Please fill in password',
              isConfirm: true,
            );
          });
    } else if (phoneNumberController.text.trim().length < 5 ||
        phoneNumberController.text.trim().length > 15) {
      ScaffoldMessenger.of(context).showSnackBar(
        buildAppSnackBar(
          bgColor: AppColors.errorRed,
          txtColor: AppColors.white,
          msg: 'Invalid phone number',
          isFloating: false,
        ),
      );
    } else {
      BlocProvider.of<RegisterBloc>(context)
          .add(RegisterDriver(RegisterDriverRequestParams(
        imageUrl: BlocProvider.of<ImageUploadBloc>(context).state.imageUrl!,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phoneNumber: selectedCountryCode.dialCode!.replaceAll('+', '') +
            phoneNumberController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )));
    }
  }
}
