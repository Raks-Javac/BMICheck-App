import 'dart:math';

import 'package:bmi_checker/src/model/bmiCalc.dart';
import 'package:bmi_checker/src/model/image.dart';
import 'package:flutter/material.dart';

enum GenderType { male, female }

class _InheritedStateContainer extends InheritedWidget {
  // Data is your entire state. In our case just 'User'
  final StateProvider data;

  // You must pass through a child and your state.
  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

class StateContainer extends StatefulWidget {
  final Widget child;

  StateContainer({
    @required this.child,
  });

  static StateProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
        .data;
  }

  @override
  StateProvider createState() => new StateProvider();
}

class StateProvider extends State<StateContainer>
    with SingleTickerProviderStateMixin {
  //Declaration of all variables used for the logic of the app
  TabController tabController;
  List<GenderImage> _genderImagePathList = [];
  var maleEnum = GenderType.male;
  var female = GenderType.female;
  GenderType genderL = GenderType.female;
  double height = 60;
  double weight = 36;
  int _counter = 24;
  int _sliderValue = 39;
  List<GenderImage> genderPictureList() => _genderImagePathList;

  void resetBmi() {
    setState(() {
      height = 60;
      weight = 30;
    });
  }

//an init state to initialize the pictures of the select gender screen image
//and the tab controller vsync
  @override
  void initState() {
    super.initState();
    _genderImagePathList
        .add(GenderImage(imagePath: 'assets/images/female.png'));
    _genderImagePathList.add(GenderImage(imagePath: 'assets/images/male.jpg'));
    tabController = TabController(length: 2, vsync: this);
  }

//setting state of the enum for active activity of the gender buttons
  void genderSelector(GenderType genderType) {
    setState(() {
      genderL = genderType;
      print("$genderType");
    });
  }

//a getter variable for the age counter
  int get counter => _counter;

  // a getter variable for the sliderValue
  int get sliderValue => _sliderValue;

//incrementer for the age counter
  void increment() => setState(() {
        _counter++;
      });

  //decrementer for the age counter
  void decrement() => setState(() {
        _counter--;
      });

//a function to change the height of the slider
  setSliderHeight(double value) {
    setState(() {
      height = value.round().toDouble();
    });
  }

//a function to change the weight of the slider
  setSliderWeight(double value) {
    setState(() {
      weight = value.round().toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }

//dispose method for disposing the tab controller for the phone memory and usage
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
