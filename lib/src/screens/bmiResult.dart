import 'package:bmi_checker/src/inheritedState.dart';
import 'package:bmi_checker/src/theme/constants.dart';
import 'package:bmi_checker/src/utils/functions.dart';
import 'package:flutter/material.dart';

class BmiCheckerResult extends StatelessWidget {
  final String bmiStatus;
  final String bmiDigit;
  final String bmiComment;
  const BmiCheckerResult({this.bmiComment, this.bmiDigit, this.bmiStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Stack(
            children: [
              text(),
              spacer(),
              result(context),
              icons(context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox spacer() {
    return SizedBox(
      height: 20,
    );
  }

  Padding text() {
    return Padding(
      padding: const EdgeInsets.only(
          left: kSmallMarginValue, top: kSmallMarginValue),
      child: Text(
        'Result',
        style: kResultHeaderTextStyle,
      ),
    );
  }

  Column icons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin:
              EdgeInsets.only(left: kHighMarginValue, right: kHighMarginValue),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.wb_sunny_rounded,
                size: kIconSize,
                color: kOpacityColor,
              ),
              GestureDetector(
                onTap: () {
                  BmiFunctions().share(
                      "I used the BMIChecker App today and my body mass index today is  \n $bmiDigit \n " +
                          bmiStatus,
                      bmiDigit,
                      bmiComment);
                },
                child: Icon(
                  Icons.share,
                  size: kIconSize,
                  color: kOpacityColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  result(BuildContext context) {
    final container = StateContainer.of(context);
    double _height = MediaQuery.of(context).size.height;
    return Positioned(
      top: 80,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 800,
        child: Stack(
          children: [
            Container(
              height: _height / 1.54,
              decoration: BoxDecoration(
                color: kOpacityColor,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: kSmallMarginValue, vertical: kSmallMarginValue),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$bmiStatus".toUpperCase(),
                        style: kBmiStatusTextStyle,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "$bmiDigit",
                        style: kBmiValueStyle,
                      ),
                      SizedBox(
                        height: kSmallMarginValue,
                      ),
                      Text("Normal BMI"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "18-25 kg/m2",
                        style: kNormalBmiTextStyle,
                      ),
                      SizedBox(height: kHighMarginValue),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: kHighMarginValue,
                            left: kSmallMarginValue,
                            right: kSmallMarginValue),
                        child: Text("$bmiComment",
                            textAlign: TextAlign.center,
                            style: kBmiStatusAdviceStyle),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: _height / 1.6,
              left: MediaQuery.of(context).size.width / 2.5,
              child: GestureDetector(
                onTap: () {
                  container.resetBmi();
                  Navigator.pop(context);
                },
                child: Container(
                  height: kBmiRedoSizing,
                  width: kBmiRedoSizing,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(colors: [
                      gradientStartColor,
                      gradientEndColor,
                    ]),
                  ),
                  child: ImageIcon(
                    AssetImage("assets/icon/redo.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
