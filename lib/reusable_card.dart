import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colorProp, this.cardChild});
  final Color colorProp;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.fromLTRB(3.0, 10.0, 3.0, 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: colorProp,
      ),
    );
  }
}

