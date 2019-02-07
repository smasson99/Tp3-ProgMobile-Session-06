import 'package:flutter/material.dart';

class TrainingLetterDisplayBox extends StatelessWidget {
  final String _value;

  TrainingLetterDisplayBox({String value}) : _value = value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AspectRatio(
        aspectRatio: 100,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  _value,
                  textScaleFactor: 90,
                )),
          ),
        ),
      ),
    );
  }
}
