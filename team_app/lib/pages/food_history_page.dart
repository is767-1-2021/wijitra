import 'package:provider/provider.dart';
import 'package:team_app/models/food_form_model.dart';
import 'package:flutter/material.dart';
import 'package:team_app/pages/daily_meal.dart';

class FoodHistory extends StatefulWidget {
  @override
  _FoodHistoryState createState() => _FoodHistoryState();
}

class _FoodHistoryState extends State<FoodHistory> {
  // String? _formData = 'Please click to fill the form';
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
                      '${form.date} ${form.time} ${form.menu} ${form.kCal}');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => meal(),
                  ),
                );
              },
              child: Text('Fill this form please'),
            ),
          ],
        ),
      ),
    );
  }
}
