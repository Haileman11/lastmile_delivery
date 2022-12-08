import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';
import 'package:lastmile_mobile/src/data/models/wallet.dart';
import 'package:lastmile_mobile/src/presentation/common/app_error.dart';
import 'package:lastmile_mobile/src/presentation/common/app_loading.dart';
import 'package:lastmile_mobile/src/presentation/common/submit_button.dart';
import 'package:lastmile_mobile/src/presentation/views/wallet_page/bloc/blocs/wallet_info/wallet_info_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/wallet_page/widgets/wallet_header_info.dart';

import 'widgets/recent_transactions.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<WalletInfoBloc, WalletInfoState>(
            builder: (context, state) {
              if (state is WalletInfoLoading) {
                return const AppLoading(size: 52);
              }

              if (state is WalletInfoError) {
                return AppError(onTap: () {
                  BlocProvider.of<WalletInfoBloc>(context)
                      .add(const GetWalletInfo());
                });
              }

              if (state is WalletInfoDone) {
                return _buildBody(state.walletModel, context);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  _buildBody(WalletModel walletModel, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WalletHeaderInfo(
          walletId: walletModel.id,
          currentBalance: walletModel.currentBalance,
          filteredBalance: walletModel.filteredBalance,
        ),
        const SizedBox(height: 20.0),
        AppSubmitButton(onTap: () {}, title: 'Cash Out'),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Earnings',
              style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.w600,
                fontSize: AppFontSizes.font_size_18,
              ),
            ),
            GestureDetector(
              onTap: () {
                NavigationService.instance
                    .navigateTo(AppRoutes.transactionHistoryPageRoute, context);
              },
              child: Text(
                'See all',
                style: TextStyle(
                  color: AppColors.appGreen,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSizes.font_size_16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        RecentTransactions(recentTransactions: walletModel.recentTransactions),
      ],
    );
  }
}
