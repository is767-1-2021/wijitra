import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/models/BMIModel.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class ServiceBmi {
  Future AddBmi(BMIModel bmiModel) async {
    await _firestore.collection("Ondiet_bmi").add({
      'bmi': bmiModel.bmi,
      'bmr': bmiModel.bmr,
      'sex': bmiModel.sex,
      'isNormal': bmiModel.isNormal,
      'isUnder': bmiModel.isUnder,
      'isOver': bmiModel.isOver,
    }).then((value) => print('User Add'));
  }
}
