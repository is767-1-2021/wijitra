import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/phattarawadee/models/first_form_model.dart';

class FirstPagew extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPagew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คะแนนที่ประเมิณ'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<FirstFormModel>(
                builder: (context, form, child) {
                  return Text('${form.age}');
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/seven');
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
