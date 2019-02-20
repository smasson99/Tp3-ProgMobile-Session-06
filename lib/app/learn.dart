import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';
import 'package:tp3/util/strings.dart';

//BEN_CORRECTION : Pourquoi n'a t-il pas son propre dossier lui aussi, comme "Training" ?

class Learn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(4.0),
      crossAxisSpacing: 8.0,
      crossAxisCount: 2,
      children: List.generate(Hiraganas.length, (index) {
        //BEN_CORRECTION : J'aurais aimé voir la carte dans son propre Widget (surtout sachant que
        //                 TrainingLetterDisplayBox existe...).
        return Card(
          child: Column(children: <Widget>[
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Center(
                  child: Text(
                    Hiraganas.keys.elementAt(index),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                Hiraganas.values.elementAt(index),
                textScaleFactor: 2,
              ),
            ),
          ]),
        );
      }),
    );
  }
}
