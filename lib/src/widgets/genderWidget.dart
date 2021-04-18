import 'package:bmi_checker/src/inheritedState.dart';
import 'package:bmi_checker/src/theme/constants.dart';
import 'package:flutter/material.dart';

enum GenderType { male, female }

class Gender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    return Container(
      height: kButtonHeight,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              spreadRadius: kSpreadRadius,
              blurRadius: kBlurRadius,
              color: Colors.black12.withOpacity(0.0))
        ],
        borderRadius: BorderRadius.circular(kButtonRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () {
                  container.genderSelector(container.female);
                },
                child: GenderButton(
                  gender: "Female",
                  buttonStyle: container.genderL == container.female
                      ? kActiveButtonColor
                      : kInactiveButtonColor,
                )),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                container.genderSelector(container.maleEnum);
              },
              child: GenderButton(
                gender: "Male",
                buttonStyle: container.genderL == container.maleEnum
                    ? kActiveButtonColor
                    : kInactiveButtonColor,
                selectedColor: container.genderL == container.maleEnum
                    ? Colors.white
                    : Colors.white.withOpacity(kGenderInActiveOpacity),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final Decoration buttonStyle;
  final Color selectedColor;
  final String gender;
  GenderButton({this.buttonStyle, this.gender, this.selectedColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buttonStyle,
      height: kButtonHeight,
      child: Center(
          child: Text(
        "$gender",
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(color: selectedColor),
      )),
    );
  }
}

//  BoxDecoration(
//         gradient: LinearGradient(colors: [
//           gradientStartColor,
//           gradientEndColor,
//         ]),
//         borderRadius: BorderRadius.circular(kButtonRadius),
//       ),