import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/napassara/models/first_form_model.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
              child: Consumer<FirstFormModel>(
                builder: (context, form, child) {
                  return Text(
                      '${form.date} ${form.time} ${form.menu} ${form.kCal}');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/2');
              },
              child: Text('Fill this form please'),
            ),
          ],
        ),
      ),
    );
  }
}
