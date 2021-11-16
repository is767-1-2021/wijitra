import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_firestore_example/old/models/food_form_model.dart';

class noteresult extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<noteresult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<FoodFormModel>(
                builder: (context, form, child) {
                  return Text(
                      '${form.diet} ${form.meal} ${form.calories} ${form.counter}');
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/eleven');
                },
                child: Text('Fill this form please'),
                style: TextButton.styleFrom(
                  primary: Colors.orangeAccent,
                  backgroundColor: Colors.green[900],
                  onSurface: Colors.black12,
                )),
          ],
        ),
      ),
    );
  }
}
