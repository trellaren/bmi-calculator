import 'package:flutter/material.dart';
import '../constants.dart';

class BinaryWidget extends StatelessWidget {
  BinaryWidget({@required this.title, this.iconType});
  final String title;
  final IconData iconType;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconType,
            size: kBinaryIconColumnHeight,
          ),
          SizedBox(
              height: kBinaryIconTextGapHeight
          ),
          Text(
              title,
              style: kLabelTextStyle,
          )
        ]
    );
  }
}