import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:pinput/pin_put/pin_put.dart';

class AppPinInput extends StatelessWidget {
  const AppPinInput(
      {Key? key, required this.pinPutController, required this.pinPutFocusNode})
      : super(key: key);

  final TextEditingController pinPutController;
  final FocusNode pinPutFocusNode;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(4.0),
      border: Border.all(color: AppColors.appGreen),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding_16),
      child: PinPut(
        eachFieldWidth: 50.0,
        eachFieldHeight: 50.0,
        eachFieldMargin: const EdgeInsets.symmetric(horizontal: 7.0),
        withCursor: true,
        cursor: Container(
          height: 20,
          width: 2,
          decoration: BoxDecoration(
            color: AppColors.appBlack,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        fieldsCount: 4,
        focusNode: pinPutFocusNode,
        controller: pinPutController,
        mainAxisSize: MainAxisSize.min,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration,
        autofocus: true,
        pinAnimationType: PinAnimationType.scale,
        textStyle: TextStyle(color: AppColors.appBlack, fontSize: 20.0),
        onSubmit: (pin) {},
      ),
    );
  }
}
