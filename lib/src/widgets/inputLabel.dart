import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String labelText;
  const InputLabel({this.labelText});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$labelText",
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
