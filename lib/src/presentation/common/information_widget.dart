import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  final double? padding;

  const InformationWidget(
      {Key? key, required this.caption, required this.value, this.padding})
      : super(key: key);

  final String caption;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(caption, style: Theme.of(context).textTheme.caption),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
