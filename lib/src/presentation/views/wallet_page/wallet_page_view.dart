import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';
import 'package:lastmile_mobile/src/presentation/views/wallet_page/widgets/wallet_header_info.dart';

class WalletPageView extends StatelessWidget {
  const WalletPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          systemOverlayStyle: getStatusBarStyle().copyWith(
            statusBarIconBrightness: Brightness.light,
          ),
          title: Text(
            'Your wallet',
            style: TextStyle(color: AppColors.white),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              WalletHeaderInfo(),
            ],
          ),
        ));
  }
}
