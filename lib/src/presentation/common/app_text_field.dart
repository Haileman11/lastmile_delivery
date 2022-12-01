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
      onChanged: (_) => setState(() {}),
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

  String? get validator {
    // at any time, we can get the text from _controller.value.text
    final text = widget.controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    // return null if the text is valid
    return null;
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
      errorText: validator,
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
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.appGreen, width: 0.8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.appGreen, width: 0.8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightGrey, width: 0.8),
      ),
    );
  }
}
