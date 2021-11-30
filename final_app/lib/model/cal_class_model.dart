import 'package:cloud_firestore/cloud_firestore.dart';

class Cal {
  String? equation;
  String? result;
  String? answerTemp;
  String? operator;

  Cal(
    this.equation,
    this.result,
    this.answerTemp,
    this.operator,
  );

  factory Cal.fromDs(
    Map<String, Object?> json,
  ) {
    return Cal(
      json['equation'] as String,
      json['resultCal'] as String,
      json['answerTemp'] as String,
      json['operator'] as String,
    );
  }
}

class AllCal {
  final List<Cal> cal;
  AllCal(this.cal);

  factory AllCal.fromSnapshot(QuerySnapshot s) {
    List<Cal> dataCal = s.docs.map((DocumentSnapshot ds) {
      return Cal.fromDs(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllCal(dataCal);
  }
}
