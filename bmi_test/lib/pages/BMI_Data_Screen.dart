// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/controllers/todo.dart';
import 'package:first_app/models/BMIModel.dart';
import 'package:first_app/pages/BMICalculatorScreen.dart';
import 'package:flutter/material.dart';

class BMI_Data_Screen extends StatefulWidget {
  const BMI_Data_Screen({Key? key}) : super(key: key);

  @override
  _BMI_Data_ScreenState createState() => _BMI_Data_ScreenState();
}

class _BMI_Data_ScreenState extends State<BMI_Data_Screen> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Ondiet_bmi').snapshots();
  late BMIModel _bmiModel;

  void _getBmiTodos(BMIModel bmiModel) async {
    await TodoController().getBmi(bmiModel, context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Image.asset(
            "assets/images/normal.png",
            fit: BoxFit.contain,
          );
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.person_outline),
              iconSize: 30.0,
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.insert_drive_file_outlined),
                iconSize: 28.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BMICalculatorScreen()));
                },
              ),
            ],
          ),
          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              return Card(
                child: ListTile(
                    title: TextButton(
                  onPressed: () {
                    _bmiModel = BMIModel(
                        bmi: data['bmi'],
                        bmr: data['bmr'],
                        isNormal: data['isNormal'],
                        isOver: data['isOver'],
                        isUnder: data['isUnder'],
                        comments: '',
                        sex: data['sex']);

                    _getBmiTodos(_bmiModel);
                  },
                  child: Text("BMI => " +
                      data['bmi'].toStringAsFixed(2) +
                      " => " +
                      data['sex'].toString()),
                )),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
