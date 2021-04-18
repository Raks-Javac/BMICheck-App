import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const TextStyle kbmiCheckSplashTextStyle = TextStyle(
  fontSize: 40,
  color: Color(0xFF00FF144),
  fontWeight: FontWeight.bold,
);
// Color kPrimaryColor = Colors.grey[850];
const String kmenuIconPath = "assets/icon/menubar.png";
const TextStyle kBodyText1 =
    TextStyle(fontSize: 17, fontWeight: FontWeight.w300);

const double kButtonHeight = 60.0;
const double kButtonRadius = 15.0;
const Color gradientStartColor = Color(0xFF0FF144);
const Color gradientEndColor = Color(0xFF018C91);
final Decoration kActiveButtonColor = BoxDecoration(
  gradient: LinearGradient(colors: [
    gradientStartColor,
    gradientEndColor,
  ]),
  borderRadius: BorderRadius.circular(kButtonRadius),
);
final Decoration kInactiveButtonColor = BoxDecoration();
const double kIconSize = 59.0;
const Color kIconColor = Colors.grey;
final Color kOpacityColor = Colors.grey[800];
const TextStyle kResultHeaderTextStyle =
    TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600);
const double kSmallMarginValue = 20.0;
const double kHighMarginValue = 30.0;
const kBmiStatusTextStyle =
    TextStyle(fontWeight: FontWeight.bold, color: gradientStartColor);
const TextStyle kBmiValueStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 65);
const TextStyle kNormalBmiTextStyle =
    TextStyle(fontSize: 15, color: Colors.grey);
const TextStyle kBmiStatusAdviceStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
const double kBmiRedoSizing = 80.0;
const double kSpreadRadius = 5.0;
const double kBlurRadius = 20.0;
const double kGenderInActiveOpacity = 0.5;
const TextStyle kCounterStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 28);
