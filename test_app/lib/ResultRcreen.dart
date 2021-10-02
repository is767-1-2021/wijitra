import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;
  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 200,
                height: 200,
                child: (bmiModel.isUnder)
                    ? Image.asset(
                        "assets/images/under.png",
                        fit: BoxFit.contain,
                      )
                    : (bmiModel.isNormal)
                        ? Image.asset(
                            "assets/images/normal.png",
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            "assets/images/over.png",
                            fit: BoxFit.contain,
                          )),
            SizedBox(
              height: 8,
            ),
            Text(
              "Your BMI is ${bmiModel.bmi.round()}",
              style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 34,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "${bmiModel.comments}",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 16,
            ),
            bmiModel.isNormal
                ? Text(
                    "WOOHOO!",
                    style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                : Text(
                    "Sadly! Your BMI is Not Normal",
                    style: TextStyle(
                        color: Colors.orange[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.amber,
                  ),
                  label: Text("LET CALCULATE AGAIN"),
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
    );
  }
}
