import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';

import 'country_code_picker_button.dart';

class CountryPickerModal extends StatefulWidget {
  const CountryPickerModal({Key? key, required this.onChangedCallback})
      : super(key: key);

  final Function(CountryCode?)? onChangedCallback;

  @override
  State<CountryPickerModal> createState() => _CountryPickerModalState();
}

class _CountryPickerModalState extends State<CountryPickerModal> {
  //CountryCode selectedCountryCode = CountryCode.fromCountryCode('ET');

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: widget.onChangedCallback,
      initialSelection: 'ET',
      favorite: const ['ET'],
      showCountryOnly: true,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
      showFlag: true,
      dialogSize: getCountrySearchDialogSize(context),
      backgroundColor: AppColors.transparent,
      dialogBackgroundColor: AppColors.white,
      barrierColor: AppColors.black.withOpacity(0.6),
      closeIcon: Icon(
        PhosphorIcons.x_light,
        size: 24,
        color: AppColors.black,
      ),
      searchStyle: TextStyle(
        color: AppColors.black,
        fontSize: AppFontSizes.font_size_16,
        fontWeight: FontWeight.w600,
      ),
      emptySearchBuilder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.padding_16,
          ),
          child: Center(
            child: Text(
              'no country by that name',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: AppFontSizes.font_size_14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
      dialogTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: AppFontSizes.font_size_14,
        fontWeight: FontWeight.w500,
      ),
      searchDecoration: InputDecoration(
        prefixIcon: Icon(
          PhosphorIcons.magnifying_glass_light,
          size: 24,
          color: AppColors.appGreen,
        ),
        fillColor: AppColors.white,
        focusColor: AppColors.white,
        hoverColor: AppColors.white,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.appGreen),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.appGreen),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.appGreen),
        ),
        hintText: 'Search for country...',
        hintStyle: TextStyle(
          color: AppColors.txtGrey,
          fontSize: AppFontSizes.font_size_14,
        ),
      ),
      flagWidth: 18,
      builder: (countryCode) {
        if (countryCode != null) {
          return CountryPickerButton(
            countryCode: countryCode,
          );
        }
      },
    );
  }

  Size getCountrySearchDialogSize(BuildContext context) {
    double screenWidth = ScreenUtil(context: context).getScreenWidth();
    double screenHeight = ScreenUtil(context: context).getScreenHeight();
    Size size = Size(screenWidth * 0.8, screenHeight * 0.8);
    return size;
  }
}
