import 'package:calculator/model/cal_class_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ACalculatorService {
  Future<List<Cal>> getCalculatorList();
  Future<void> addCal(Cal items);
}

class CalculatorService {
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('calculator');

  Future<void> addCal(Cal items) {
    return _ref.add({
      'equation': items.equation,
      'answerTemp': items.answerTemp,
      'operator': items.operator,
      'resultCal': items.result,
    });
  }

  Future<List<Cal>> getCalculatorList() async {
    QuerySnapshot snapshot = await _ref.get();

    AllCal cal = AllCal.fromSnapshot(snapshot);
    return cal.cal;
  }
}
