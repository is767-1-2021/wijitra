import 'package:flutter/material.dart';

class FirstFormModel extends ChangeNotifier {
  int _score = 1;

  get score => this._score;

  set score(value) {
    this._score = value;
    notifyListeners();
  }
}
