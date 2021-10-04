import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/first_form_model.dart';
import 'models/food_form_model.dart';
import 'pages/BMICalculatorScreen.dart';
import 'pages/Home_menu.dart';
import 'pages/workout.dart';
import 'pages/sitemap.dart';
import 'pages/menu_page.dart';
import 'pages/daily_meal.dart';
import 'pages/score_result.dart';
import 'pages/welcome.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirstFormModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodFormModel(),
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
        initialRoute: '/one',
        routes: <String, WidgetBuilder>{
          '/one': (context) => Welcome(),
          '/two': (context) => BMICalculatorScreen(),
          '/three': (context) => sitemap(),
          '/four': (context) => workout(),
          '/five': (context) => meal(),
          '/six': (context) => MenuPage(),
          '/seven': (context) => score_result(),
          '/eight': (context) => Home(),
        });
  }
}
