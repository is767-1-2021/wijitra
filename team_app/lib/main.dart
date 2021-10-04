import 'package:flutter/material.dart';
import 'wijitra/BMICalculatorScreen.dart';
import 'wijitra/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.pinkAccent,
          scaffoldBackgroundColor: Colors.black12,
        ),
        home: BMICalculatorScreen(),
        initialRoute: '/1',
        routes: <String, WidgetBuilder>{
          '/1': (context) => Home(),
          '/2': (context) => BMICalculatorScreen(),
        });
  }
}
