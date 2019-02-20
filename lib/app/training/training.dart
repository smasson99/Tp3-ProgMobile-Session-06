import 'dart:math';
import 'package:flutter/material.dart';
import 'trainingLetterBox.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

class Training extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TrainingState();
  }
}

class _TrainingState extends State<Training> {
  final int numberOfAnswers = 3; //BEN_CORRECTION : Ce n'est pas une constante au yeux du langage. De plus, ce n'est pas le bon type de nommage.

  List<String> _answers;
  List<bool> _buttonsStatus;
  String _chosenSymbol;
  Random _random;

  _TrainingState() {
    _random = new Random();
    _buttonsStatus = new List<bool>();

    for (int i = 0; i < numberOfAnswers; ++i) {
      _buttonsStatus.add(true);
    }

    generateAnswersList(numberOfAnswers);
  }

  generateAnswersList(int length) {
    _answers = new List<String>();

    _chosenSymbol =
        Hiraganas.keys.elementAt(_random.nextInt(Hiraganas.keys.length));

    for (int i = 0; i < length; ++i) {
      String valueToAdd =
          Hiraganas.values.elementAt(_random.nextInt(Hiraganas.values.length));

      while (_answers.contains(valueToAdd)) {
        valueToAdd = Hiraganas.values
            .elementAt(_random.nextInt(Hiraganas.values.length));
      }

      _answers.add(valueToAdd);
    }

    if (!_answers.contains(Hiraganas[_chosenSymbol])) {
      _answers[_random.nextInt(length)] = Hiraganas[_chosenSymbol];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(child: TrainingLetterDisplayBox(value: _chosenSymbol)),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: _answers.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return FlatButton(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        _answers.elementAt(index),
                        textScaleFactor: 4,
                      ),
                    ),
                    disabledTextColor: Colors.red,
                    onPressed: _buttonsStatus[index]
                        ? () {
                            onAnswerFlatButtonSelected(index);
                          }
                        : null,
                  );
                }),
          )
        ],
      ),
    );
  }

  enableAllFlatButtons() {
    for (int i = 0; i < _buttonsStatus.length; ++i) {
      _buttonsStatus[i] = true;
    }
  }

  onAnswerFlatButtonSelected(int index) {
    setState(() {
      if (Hiraganas[_chosenSymbol] != _answers.elementAt(index)) {
        _buttonsStatus[index] = false;
      } else {
        enableAllFlatButtons();
        generateAnswersList(numberOfAnswers);
      }
    });
  }
}
