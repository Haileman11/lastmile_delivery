import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/presentation/common/swipable_widget.dart';

class SwipingButton extends StatelessWidget {
  /// The text that the button will display.
  final String text;

  /// The callback invoked when the button is swiped.
  final VoidCallback onSwipeCallback;

  final Color color;

  const SwipingButton({
    super.key,
    required this.text,
    required this.onSwipeCallback,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Container(
            height: 50.0,
            color: color.withOpacity(0.5),
          ),
          SwipeableWidget(
            height: 50.0,
            onSwipeCallback: onSwipeCallback,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: color,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: _buildContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    final textStyle = TextStyle(
        fontSize: 17.0, fontWeight: FontWeight.w400, color: Colors.white);
    return Flexible(
      flex: 2,
      child: Text(
        text.toUpperCase(),
        style: textStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
        Flexible(
          child: SizedBox(
            width: 30,
          ),
        ),
        _buildText(),
      ],
    );
  }
}
