import 'package:bmi_checker/src/inheritedState.dart';
import 'package:bmi_checker/src/theme/constants.dart';
import 'package:flutter/material.dart';

class Age extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    return _ageWidget(container);
  }

  Widget _ageWidget(StateProvider container) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: RoundedButton(
              icon: Icons.remove,
              onTap: container.decrement,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                  child: Text(
                "${container.counter}",
                style: kCounterStyle,
              )),
            ),
          ),
          Expanded(
            flex: 1,
            child: RoundedButton(
              icon: Icons.add,
              onTap: container.increment,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;

  const RoundedButton({this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      child: RawMaterialButton(
        shape: CircleBorder(),
        child: Center(child: Icon(icon)),
        elevation: 25,
        fillColor: Theme.of(context).primaryColor,
        onPressed: onTap,
      ),
    );
  }
}
