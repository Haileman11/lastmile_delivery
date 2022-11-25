import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/order_history/blocs/order_history/order_history_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/order_history/widgets/order_history_item.dart';

class OrderHistoryPageView extends StatelessWidget {
  const OrderHistoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('ORDERS_HISTORY_PAGE'),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBlack,
        automaticallyImplyLeading: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: Text(
          'Orders history',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
        builder: (context, state) {
          if (state is OrderHistoryLoading) {
            return CircularProgressIndicator(color: AppColors.appBlack);
          }

          if (state is OrderHistoryError) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<OrderHistoryBloc>(context)
                    .add(const GetOrderHistory());
              },
              child: Center(
                  child: const Text('Something went wrong, Tap to try again')),
            );
          }

          if (state is OrderHistoryDone) {
            List<Widget> orders = [];
            state.orders.forEach((element) {
              orders.add(OrderListItem(orderModel: element));
            });
            return _buildBody(orders);
          }

          return const SizedBox();
        },
      ),
    );
  }

  _buildBody(List<Widget> orders) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${orders.length} orders',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: AppFontSizes.font_size_18,
                    ),
                  ),
                  Icon(
                    Icons.sort,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
            Column(
              children: orders,
            ),
          ],
        ),
      ),
    );
  }
}
