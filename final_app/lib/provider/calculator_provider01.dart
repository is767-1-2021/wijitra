import 'dart:collection';

import 'package:calculator/model/cal_class_model.dart';
import 'package:calculator/services/calculator_service.dart';
import 'package:flutter/cupertino.dart';

class CalculatorProvider01 extends ChangeNotifier {
  String? equation;
  String? result;
  String? answer;
  String? answerTemp;
  String? operator;

  get EquationCal => this.equation;

  set EquationCal(value) {
    this.equation = value;
    notifyListeners();
  }

  get ResultCal => this.result;
  set ResultCal(value) {
    this.result = value;
    notifyListeners();
  }

  get Answer => this.result;
  set Answer(value) {
    this.result = value;
    notifyListeners();
  }

  get AnswerTemp => this.result;
  set AnswerTemp(value) {
    this.result = value;
    notifyListeners();
  }

  get Operator => this.result;
  set Operator(value) {
    this.result = value;
    notifyListeners();
  }

  final List<Cal> _item = [];

  UnmodifiableListView<Cal> get items => UnmodifiableListView(_item);

  List<Cal> getCalList() {
    return _item;
  }

  void AddCal(Cal item) {
    _item.add(item);
    print(_item[0].result);
    CalculatorService().addCal(item);
    notifyListeners();
  }
}
