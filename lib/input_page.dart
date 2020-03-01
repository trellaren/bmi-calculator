import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'binary_icons.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget> [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colorProp: selectedGender == Gender.male
                        ? kDefaultCardColor
                        : kInactiveCardColor,
                    cardChild: BinaryWidget(
                      title: 'Male',
                      iconType: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colorProp: selectedGender == Gender.female
                        ? kDefaultCardColor
                        : kInactiveCardColor,
                    cardChild: BinaryWidget(
                      title: 'Female',
                      iconType: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            )),
            Expanded(child:
              ReusableCard(
                colorProp: kDefaultCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kBigDickTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 90.0,
                      max: 250.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Row(
              children: <Widget> [
                Expanded(child:
                  ReusableCard(colorProp: kDefaultCardColor,),
                ),
                Expanded(child:
                  ReusableCard(colorProp: kDefaultCardColor,),
                ),
              ],
            )),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}