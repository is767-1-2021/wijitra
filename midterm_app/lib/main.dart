import 'package:flutter/material.dart';
import 'package:midterm_app/Home.dart';
import 'package:midterm_app/first_page.dart';
import 'package:provider/provider.dart';
import 'BMICalculatorScreen.dart';
import 'ResultFemale.dart';
import 'ResultMale.dart';
import 'blank.dart';
import 'models/first_form_model.dart';
import 'sixth_page.dart';

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
        home: Home(),
        initialRoute: '/1',
        routes: <String, WidgetBuilder>{
          '/1': (context) => Home(),
          '/2': (context) => BMICalculatorScreen(),
          '/3': (context) => ResultFemale(),
          '/4': (context) => ResultMale(),
          '/5': (context) => FirstPage(),
          '/6': (context) => SixthPage(),
          '/7': (context) => blank(),
        });
  }
}
