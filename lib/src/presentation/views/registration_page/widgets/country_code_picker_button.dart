import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

class CountryPickerButton extends StatelessWidget {
  const CountryPickerButton({
    Key? key,
    required this.countryCode,
  }) : super(key: key);

  final CountryCode countryCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey, width: 0.7),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 13.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: AppMargin.margin_12,
          ),
          Container(
            width: 20.0,
            height: 20.0,
            child: Image(
              image: AssetImage(
                countryCode.flagUri!,
                package: 'country_code_picker',
              ),
            ),
          ),
          const SizedBox(
            width: AppMargin.margin_8,
          ),
          Text(
            '$countryCode',
            style: TextStyle(
              fontSize: AppFontSizes.font_size_16,
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: AppMargin.margin_20,
          ),
        ],
      ),
    );
  }
}
