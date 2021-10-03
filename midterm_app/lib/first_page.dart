import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/first_form_model.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
                  return Text('${form.score}');
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/6');
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
