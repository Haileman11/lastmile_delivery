import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/wallet_page/blocs/cubits/date_filter/date_filter_cubit.dart';

class DateFilter extends StatelessWidget {
  const DateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 30.0,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.appGreen, width: 0.8),
        borderRadius: const BorderRadius.all(Radius.circular(3.0)),
      ),
      child: BlocBuilder<DateFilterCubit, Map<String, dynamic>>(
        builder: (context, state) {
          return DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 13.0,
              value: state["value"],
              isExpanded: true,
              icon: const Icon(PhosphorIcons.caret_down),
              elevation: 1,
              enableFeedback: false,
              dropdownColor: AppColors.white,
              style: TextStyle(
                fontSize: AppFontSizes.font_size_12,
                color: AppColors.black,
              ),
              onChanged: (String? newValue) {
                BlocProvider.of<DateFilterCubit>(context)
                    .changeValue(newValue!);
              },
              items: BlocProvider.of<DateFilterCubit>(context)
                  .items
                  .map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value['value'],
                  child: Text(
                    value['label'],
                    style: const TextStyle(
                      fontSize: AppFontSizes.font_size_10,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
