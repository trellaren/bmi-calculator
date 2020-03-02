import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Locals
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../components/binary_icons.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import 'package:flutter_app/calculator.dart';

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
  double heightInIn = 71;
  double heightInCm;
  int weight = 84;
  double weightInKg;
  double weightInLbs = 185;
  double feet = 5;
  double inches = 11;
  int age = 30;

  double convertToLbs() {
    weightInKg = weight.toDouble();
    return weightInLbs = weightInKg * 2.2;
  }

  double convertToInches() {
    heightInCm = height.toDouble();
    heightInIn = heightInCm * .39370;
    convertToFeet();
  }

  double convertToFeet() {
    feet = heightInIn / 12;
    inches = heightInIn % 12;
  }

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
            Expanded(
                child: Row(
              children: <Widget>[
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
            Expanded(
              child: ReusableCard(
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
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          feet.toInt().toString(),
                          style: kBigDickTextStyle,
                        ),
                        Text(
                          'ft',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          inches.toInt().toString(),
                          style: kBigDickTextStyle,
                        ),
                        Text(
                          'in',
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
                          heightInIn = convertToInches();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      colorProp: kDefaultCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toInt().toString(),
                                style: kWeightTextStyle,
                              ),
                              Text(
                                'KG',
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                weightInLbs.toInt().toString(),
                                style: kWeightTextStyle,
                              ),
                              Text(
                                'LBS',
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                    weightInLbs = convertToLbs();
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                    weightInLbs = convertToLbs();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      colorProp: kDefaultCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBigDickTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            )),
            BottomButton(
              buttonTitle: 'CALCULATE YOUR BMI',
              onTap: () {

                Calculator calc = Calculator(heightInCM: height, weightInKG: weight);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Results(
                      bmiResult: calc.calculateMetricBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}