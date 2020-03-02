import 'package:flutter/material.dart';

import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class Results extends StatelessWidget {
  Results({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'Your Result',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colorProp: kDefaultCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      'Normal BMI range:',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      '18.5 - 25 kg/m2',
                      style: kButtonTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 3.0, 35.0, 3.0),
                      child: Center(
                        child: Text(
                          interpretation,
                          style: kButtonTextStyle,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        print('This function doesn\'t actually do anything');
                      },
                      color: Color(0xFF1D1F33),
                      textColor: Color(0xFFFFFFFF),
                      child: Text(
                        'SAVE RESULT',
                      )
                    )
                  ],
                ),
              )
            ),
            BottomButton(
              buttonTitle: 'RE-CALCULATE YOUR BMI',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}