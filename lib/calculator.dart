import 'package:flutter/material.dart';
import 'dart:math';

class Calculator{
  Calculator({this.heightInCM, this.weightInKG});

  final int heightInCM;
  final int weightInKG;
  double heightInM;
  double _bmi;

  String calculateMetricBMI() {
    _bmi = weightInKG / pow(heightInCM/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else{
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if(_bmi >= 25) {
      return 'God Damn, you\'re fat';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight.';
    } else{
      return 'You\'re on the small side.';
    }
  }
}

// BMI = mass(kg) / height(m) = mass(lb) / height(in) x 703