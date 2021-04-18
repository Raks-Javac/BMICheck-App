import 'package:bmi_checker/src/theme/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderWidget extends StatelessWidget {
  final double sliderThermo;
  double sliderRangeValue;
  final Function sliderFunction;
  SliderWidget({this.sliderRangeValue, this.sliderFunction, this.sliderThermo});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text("${sliderThermo.round()}"),
                  SizedBox(
                    width: 10,
                    child: RotatedBox(
                      quarterTurns: 20,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 2,
              thumbColor: gradientStartColor,
              inactiveTrackColor: Theme.of(context).primaryColor,
              activeTrackColor: gradientStartColor,
              activeTickMarkColor: gradientStartColor,
            ),
            child: Slider(
              autofocus: true,
              value: sliderRangeValue,
              min: 0,
              max: 100,
              label: "${sliderRangeValue.round()}",
              onChanged: sliderFunction,
            ),
          )
        ],
      ),
    );
  }
}
