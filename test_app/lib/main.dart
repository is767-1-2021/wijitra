import 'package:flutter/material.dart';

import 'BMICalculatorScreen.dart';
import 'fifth_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: FifthPage(),
        initialRoute: '/1',
        routes: <String, WidgetBuilder>{
          '/5': (context) => FifthPage(),
          '/1': (context) => BMICalculatorScreen(),
        });
  }
}
