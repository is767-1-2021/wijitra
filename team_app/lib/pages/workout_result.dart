import 'package:team_app/models/first_form_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class result extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('work out record'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<FirstFormModel>(
                builder: (context, form, child) {
                  return Text('${form.date} ${form.time} ${form.workout}');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/four');
              },
              child: Text('Fill this form please'),
            ),
          ],
        ),
      ),
    );
  }
}
