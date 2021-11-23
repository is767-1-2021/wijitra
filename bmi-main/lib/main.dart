import 'package:firebase_core/firebase_core.dart';
import 'package:exercise_app/pages/home.dart';
import 'package:flutter/material.dart';

import 'pages/BMICalculatorScreen.dart';
import 'pages/BMI_Data_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), routes: <String, WidgetBuilder>{
      '/BMI': (context) => BMICalculatorScreen(),
      '/BMI_Data': (context) => BMI_Data_Screen(),
      '/home': (context) => HomeScreen(),
    });
  }
}
