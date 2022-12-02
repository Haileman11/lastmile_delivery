import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';
import 'package:lastmile_mobile/src/presentation/common/app_loading.dart';
import 'package:lastmile_mobile/src/presentation/common/submit_button.dart';
import 'package:lastmile_mobile/src/presentation/views/account_pending_page/widgets/required_documents.dart';

class AccountPendingPage extends StatelessWidget {
  const AccountPendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: getStatusBarStyle().copyWith(
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          'Account pending',
          style: TextStyle(color: AppColors.white),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.black,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLoading(size: 30.0),
            const SizedBox(height: 10.0),
            const Text(
              'Your status is pending',
              style: TextStyle(fontSize: AppFontSizes.font_size_18),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Please read the terms and services and prepare the following files for approval',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: AppFontSizes.font_size_14, color: AppColors.grey),
            ),
            const SizedBox(height: 30.0),
            const RequiredDocuments(),
            const Expanded(child: SizedBox()),
            AppSubmitButton(
              onTap: () {},
              title: 'Terms and conditions',
            ),
          ],
        ),
      ),
    );
  }
}
