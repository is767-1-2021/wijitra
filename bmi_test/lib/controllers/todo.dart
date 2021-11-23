import 'package:first_app/models/BMIModel.dart';
import 'package:first_app/pages/ResultFemale.dart';
import 'package:first_app/pages/Resultmale.dart';
import 'package:first_app/services/bmi_service.dart';
import 'package:flutter/material.dart';

class TodoController {
  Future getBmi(BMIModel bmiModel, BuildContext context) async {
    if (bmiModel.sex == "Male") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultMale(
            bmiModel: bmiModel,
            bmrModel: bmiModel.bmr.toStringAsFixed(2),
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultFemale(
            bmiModel: bmiModel,
            bmrModel: bmiModel.bmr.toStringAsFixed(2),
          ),
        ),
      );
    }
  }

  Future addBmi(BMIModel _bmiModel, context) async {
    await ServiceBmi().AddBmi(_bmiModel);
    if (_bmiModel.sex == "Female") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultFemale(
            bmiModel: _bmiModel,
            bmrModel: _bmiModel.toString(),
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultMale(
            bmiModel: _bmiModel,
            bmrModel: _bmiModel.toString(),
          ),
        ),
      );
    }
  }
}
