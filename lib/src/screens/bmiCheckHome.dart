import 'package:bmi_checker/src/inheritedState.dart';
import 'package:bmi_checker/src/model/bmiCalc.dart';

import 'package:bmi_checker/src/screens/bmiResult.dart';
import 'package:bmi_checker/src/widgets/ageWidget.dart';
import 'package:bmi_checker/src/theme/constants.dart';
import 'package:bmi_checker/src/widgets/genderWidget.dart';
import 'package:bmi_checker/src/widgets/inputLabel.dart';
import 'package:bmi_checker/src/widgets/slider.dart';

import 'package:flutter/material.dart';

class BmiCheckerHomeScreen extends StatefulWidget {
  @override
  _BmiCheckerHomeScreenState createState() => _BmiCheckerHomeScreenState();
}

class _BmiCheckerHomeScreenState extends State<BmiCheckerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _container = StateContainer.of(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          elevation: 10,

          // leading: ImageIcon(
          //   AssetImage(
          //     kmenuIconPath,
          //   ),
          //   size: 16,
          // ),
          title: Text('BMICheck',
              style: Theme.of(context).appBarTheme.titleTextStyle),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 15, right: 8),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              InputLabel(
                labelText: "Selected Gender",
              ),
              _spacer(),
              Gender(),
              SizedBox(
                height: 30,
              ),
              InputLabel(
                labelText: "Set Age",
              ),
              _spacer(),
              Age(),
              SizedBox(
                height: 30,
              ),
              InputLabel(
                labelText: "Height in centimetres(cm)",
              ),
              _spacer(),
              SliderWidget(
                sliderThermo: _container.height.toDouble(),
                sliderRangeValue: _container.height.toDouble(),
                sliderFunction: (double value) {
                  _container.setSliderHeight(value);
                },
              ),
              SizedBox(
                height: 30,
              ),
              InputLabel(
                labelText: "Weight in kilograms(kg)",
              ),
              _spacer(),
              SliderWidget(
                sliderThermo: _container.weight.toDouble(),
                sliderRangeValue: _container.weight.toDouble(),
                sliderFunction: (double value) {
                  _container.setSliderWeight(value);
                },
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: _router,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: kActiveButtonColor,
                  height: 58,
                  child: Center(
                    child: Text(
                      "CALCULATE BMI",
                      style: TextStyle(fontSize: 20, letterSpacing: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ));
  }

  SizedBox _spacer() {
    return SizedBox(
      height: 20,
    );
  }

  void _router() {
    final _container = StateContainer.of(context);
    BmiCalc calc =
        BmiCalc(bmiHeight: _container.height, bmiWeight: _container.height);
    print("${calc.calcBmi()}");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BmiCheckerResult(
        bmiDigit: calc.calcBmi(),
        bmiStatus: calc.bmiStatus(),
        bmiComment: calc.bmiComment(),
      );
    }));
  }
}
