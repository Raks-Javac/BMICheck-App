import 'package:flutter/material.dart';

class BmICheckerSplashScreen extends StatefulWidget {
  BmICheckerSplashScreen({Key key}) : super(key: key);

  @override
  _BmICheckerSplashScreenState createState() => _BmICheckerSplashScreenState();
}

class _BmICheckerSplashScreenState extends State<BmICheckerSplashScreen> {
  @override
  void initState() {
    super.initState();
    _popOffStackSplashScreen();
  }

  Future _popOffStackSplashScreen() {
    return Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/select');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "BMICheck",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
