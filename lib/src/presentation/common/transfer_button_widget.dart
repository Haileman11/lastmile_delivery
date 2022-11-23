import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/cancel_reasons_widget.dart';

class TransferButton extends StatelessWidget {
  const TransferButton({Key? key, required this.orderId}) : super(key: key);

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.errorRed)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            enableDrag: true,
            isDismissible: false,
            builder: (context) {
              return CancelReasonsWidget(orderId: orderId, isTransfer: true);
            },
          );
        },
        child: const Text("Transfer"),
      ),
    );
  }
}
