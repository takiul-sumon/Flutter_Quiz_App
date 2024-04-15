import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final resethandler;

  Result(this.resultscore, this.resethandler);

  String get resultphrase {
    String resulttext = 'You did it';
    {
      if (resultscore < 8) {
        resulttext = 'Awsome';
      } else if (resultscore <= 12) {
        resulttext = 'Pretty';
      } else if (resultscore <= 12) {
        resulttext = 'Decent';
      } else {
        resulttext = 'You are so bad';
      }
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(resultphrase),
        ElevatedButton(onPressed: resethandler, child: Text("Restrart Quiz"))
      ],
    ));
  }
}
