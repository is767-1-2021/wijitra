import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;
  ResultScreen({this.bmiModel});

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
                  child: bmiModel.isNormal
                      ? Image.asset(
                          "assets/images/normal.png",
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          "assets/images/over.png",
                          fit: BoxFit.contain,
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
