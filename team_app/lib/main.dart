import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

//import 'package:team_app/controllers/bmi_bmr.dart';
//import 'package:team_app/services/services.dart';

//import 'models/first_form_model.dart';
//import 'models/food_form_model.dart';
/*import 'pages/BMICalculatorScreen.dart';
import 'pages/Home_menu.dart';
import 'pages/note_page.dart';
import 'pages/workout.dart';
import 'pages/sitemap.dart';
import 'pages/menu_page.dart';
import 'pages/daily_meal.dart';
import 'pages/score_result.dart';
import 'pages/welcome.dart';
import 'pages/workout_result.dart';

import 'package:flutter/material.dart';*/

import 'update/display.dart';
import 'update/form.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [FormScreen(), DisplayScreen()],
        ),
        backgroundColor: Colors.blue,
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              text: "บันทึกมื้ออาหาร",
            ),
            Tab(
              text: "ราการอาหาร",
            )
          ],
        ),
      ),
    );
  }
}




/*void main() {
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
}*/

/*Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
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
          '/seven': (context) => SixthPage(),
          '/eight': (context) => Home(),
          '/nine': (context) => workout(),
          '/ten': (context) => result(),
          '/eleven': (context) => NotePage(),
        });
  }
}
*/