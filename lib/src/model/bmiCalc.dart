import 'dart:math';

class BmiCalc {
  double bmiHeight;
  double bmiWeight;

  double _bmi;

  BmiCalc({this.bmiHeight, this.bmiWeight});

  double get bmiHeightValue => bmiHeight;
  double get bmiWeightValue => bmiWeight;

  String calcBmi() {
    double _height = (bmiHeight / 100);
    _bmi = bmiWeight / pow(_height, 2);

    return _bmi.toStringAsFixed(1);
  }

  String bmiStatus() {
    if (_bmi >= 25) {
      return "OverWeight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "underweight";
    }
  }

  String bmiComment() {
    if (_bmi >= 25) {
      return "Your BMI result is above normal , you need to lessen your current food intake.";
    } else if (_bmi > 18.5) {
      return "Your BMI result is normal , you are just in the right position to hit any form";
    } else {
      return "Your BMI result is below normal , you need to eat alittle bit more.";
    }
  }
}
