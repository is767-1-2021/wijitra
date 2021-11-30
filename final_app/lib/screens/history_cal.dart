import 'package:calculator/model/cal_class_model.dart';
import 'package:calculator/services/calculator_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryCal extends StatefulWidget {
  const HistoryCal({Key? key}) : super(key: key);

  @override
  _HistoryCalState createState() => _HistoryCalState();
}

class _HistoryCalState extends State<HistoryCal> {
  List<Cal> _calList = List.empty();

  // ignore: must_call_super
  void initState() {
    _getCalculator();
  }

  @override
  // ignore: override_on_non_overriding_member
  void _getCalculator() async {
    List<Cal> newCalList = await CalculatorService().getCalculatorList();
    setState(() {
      _calList = newCalList;
    });
  }

  // ignore: unused_field
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('calculator').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History          Memory"), actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
          color: Colors.black,
        ),
      ]),
      body: ListView.builder(
        itemCount: _calList.length,
        itemBuilder: (context, int index) {
          var value = _calList[index];
          print('${value.equation} ${value.operator}');
          return Card(
            child: ListTile(
              title: Text(
                '${value.equation} ${value.operator} ${value.answerTemp} =',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                value.result.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
