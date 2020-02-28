import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'binary_icons.dart';

// Can I just export this into another file and call it style.dart?
const double bottomContainerHeight = 80.0;
const Color defaultCardColor = Color(0xFF101427);
const Color bottomContainerColor = Color(0xFFEB1555);
const Color labelTextColor = Color(0xFF8D8E98);
const double binaryIconColumnHeight = 80.0;
const double binaryIconFontSize = 18.0;
const double binaryIconTextGapHeight = 15.0;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Column(
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget> [
                Expanded(child:
                  ReusableCard(
                    colorProp: defaultCardColor,
                    cardChild: BinaryWidget(
                      title: 'Male',
                      iconType: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(child:
                  ReusableCard(
                    colorProp: defaultCardColor,
                    cardChild: BinaryWidget(
                      title: 'Female',
                      iconType: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            )),
            Expanded(child:
              ReusableCard(colorProp: defaultCardColor,),
            ),
            Expanded(child: Row(
              children: <Widget> [
                Expanded(child:
                  ReusableCard(colorProp: defaultCardColor,),
                ),
                Expanded(child:
                  ReusableCard(colorProp: defaultCardColor,),
                ),
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}