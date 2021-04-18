import 'package:bmi_checker/src/inheritedState.dart';
import 'package:bmi_checker/src/screens/bmiCheckHome.dart';
import 'package:bmi_checker/src/screens/bmiCheckSplashScreen.dart';
import 'package:bmi_checker/src/screens/bmiGender.dart';
import 'package:bmi_checker/src/screens/bmiResult.dart';
import 'package:bmi_checker/src/theme/customTheme.dart';
import 'package:flutter/material.dart';

CustomTheme customTheme = CustomTheme();

void main() => runApp(StateContainer(child: BMIChecker()));

class BMIChecker extends StatelessWidget {
  static const bool showDebugBanner = false;
  final bool darkMode = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMIChecker",
      theme: darkMode == true ? CustomTheme.darkTheme : CustomTheme.lightTheme,
      debugShowCheckedModeBanner: showDebugBanner,
      initialRoute: '/',
      routes: {
        '/': (context) => BmICheckerSplashScreen(),
        '/select': (context) => BmiSelectGender(),
        '/home': (context) => BmiCheckerHomeScreen(),
        '/result': (context) => BmiCheckerResult()
      },
    );
  }
}
