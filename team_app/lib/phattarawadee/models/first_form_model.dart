import 'package:flutter/material.dart';

class FirstFormModel extends ChangeNotifier {
  String? _diet = 'None';
  String? _meal;
  int? _calories;
  int _counter = 0;
  String? _date;
  String? _time;
  String? _menu;
  int? _kCal;
  String? _firstName;
  String? _lastName;
  String? _sport;
  int? _age;

  get diet => this._diet;
  set diet(value) {
    this._diet = value;
    notifyListeners();
  }

  get meal => this._meal;
  set meal(value) {
    this._meal = value;
    notifyListeners();
  }

  get calories => this._calories;
  set calories(value) {
    this._calories = value;
    notifyListeners();
  }

  get counter => this._counter;
  set counter(value) {
    this._counter = value;
    notifyListeners();
  }

  get date => this._date;
  set date(value) {
    this._date = value;
    notifyListeners();
  }

  get time => this._time;
  set time(value) {
    this._time = value;
    notifyListeners();
  }

  get menu => this._menu;
  set menu(value) {
    this._menu = value;
    notifyListeners();
  }

  get kCal => this._kCal;
  set kCal(value) {
    this._kCal = value;
    notifyListeners();
  }

  get firstName => this._firstName;
  set firstName(value) {
    this._firstName = value;
    notifyListeners();
  }

  get lastName => this._lastName;
  set lastName(value) {
    this._lastName = value;
    notifyListeners();
  }

  get sport => this._sport;
  set sport(value) {
    this._sport = value;
    notifyListeners();
  }

  get age => this._age;
  set age(value) {
    this._age = value;
    notifyListeners();
  }
}
