import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    this.labelText = '',
    this.isNumber = false,
    this.isEmail = false,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool isNumber;
  final bool isEmail;
  final bool isPassword;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _isObscure;

  @override
  void initState() {
    _isObscure = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      textAlignVertical: TextAlignVertical.center,
      autofocus: false,
      cursorColor: AppColors.appBlack,
      onChanged: (key) {},
      maxLength: widget.isNumber ? 9 : 40,
      readOnly: false,
      keyboardType: widget.isNumber
          ? TextInputType.number
          : widget.isEmail
              ? TextInputType.emailAddress
              : TextInputType.text,
      enabled: true,
      style: TextStyle(
        color: AppColors.black,
        fontSize: AppFontSizes.font_size_18,
      ),
      decoration: widget.isPassword
          ? fieldDecoration(widget.labelText).copyWith(
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.appGreen,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            )
          : fieldDecoration(widget.labelText),
    );
  }

  InputDecoration fieldDecoration(String labelText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppPadding.padding_8,
        horizontal: AppPadding.padding_10,
      ),
      label: Text(
        labelText,
        style: TextStyle(
          fontSize: AppFontSizes.font_size_16,
          color: AppColors.grey,
          fontWeight: FontWeight.w300,
        ),
      ),
      errorStyle: TextStyle(
        fontSize: AppFontSizes.font_size_12,
        color: AppColors.errorRed,
        fontWeight: FontWeight.w400,
      ),
      //border: InputBorder.none,
      focusColor: AppColors.appGreen,
      counterText: '',
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.appGreen, width: 0.8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.appGreen, width: 0.8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightGrey, width: 0.8),
      ),
    );
  }
}
