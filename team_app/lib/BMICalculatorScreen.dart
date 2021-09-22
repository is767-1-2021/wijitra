import 'package:team_app/BMIModel.dart';
import 'package:team_app/ResultScreen.dart';
import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;
  double _bmi = 0;
  late BMIModel _bmiModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  "assets/images/popcat1.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.pink[400],
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Pop Pop your BMI",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Height (cm)",
                style: TextStyle(
                    color: Colors.orange[700],
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0.0,
                  max: 250.0,
                  onChanged: (height) {
                    setState(() {
                      _heightOfUser = height;
                    });
                  },
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink[400],
                  label: "$_heightOfUser",
                ),
              ),
              Text(
                "$_heightOfUser cm",
                style: TextStyle(
                    color: Colors.orange[300],
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "Weight (kg)",
                style: TextStyle(
                    color: Colors.orange[700],
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0.0,
                  max: 250.0,
                  onChanged: (height) {
                    setState(() {
                      _weightOfUser = height;
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink[400],
                  label: "$_weightOfUser",
                ),
              ),
              Text(
                "$_weightOfUser kg",
                style: TextStyle(
                    color: Colors.orange[300],
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _bmi = _weightOfUser /
                            ((_heightOfUser / 100) * (_heightOfUser / 100));

                        if (_bmi >= 18.5 && _bmi <= 25) {
                          _bmiModel = BMIModel(
                              bmi: _bmi,
                              isNormal: true,
                              comments: "Your BMI is Normal");
                        } else if (_bmi < 18.5) {
                          _bmiModel = BMIModel(
                              bmi: _bmi,
                              isNormal: false,
                              comments: "You are Underweighted");
                        } else if (_bmi > 25 && _bmi <= 30) {
                          _bmiModel = BMIModel(
                              bmi: _bmi,
                              isNormal: false,
                              comments: "You are Overweighted");
                        } else {
                          _bmiModel = BMIModel(
                              bmi: _bmi,
                              isNormal: false,
                              comments: "You are Obesed");
                        }
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                    bmiModel: _bmiModel,
                                  )));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.amber,
                    ),
                    label: Text("CALCULATE"),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                      onSurface: Colors.grey,
                    )),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
