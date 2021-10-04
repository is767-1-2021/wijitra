import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/jirutcha/Pages/SecondPage.dart';
import 'package:team_app/napassara/Pages/first_page.dart';
import 'package:team_app/napassara/Pages/second_page.dart';
import 'package:team_app/phattarawadee/models/first_form_model.dart';
import 'package:team_app/sixth_page.dart';
import 'wijitra/BMICalculatorScreen.dart';
import 'wijitra/Home.dart';
import 'wijitra/menu.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirstFormModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

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
        initialRoute: '/three',
        routes: <String, WidgetBuilder>{
          '/one': (context) => Home(),
          '/two': (context) => BMICalculatorScreen(),
          '/three': (context) => Menu(),
          '/four': (context) => SecondPage(),
          '/five': (context) => First_Page(),
          '/six': (context) => dailymeal(),
          '/seven': (context) => SixthPage(),
        });
  }
}
