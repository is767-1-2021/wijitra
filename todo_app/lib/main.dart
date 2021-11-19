import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_firestore_example/ming/screens/home/home.dart';

import 'bmi_bmr/screens/main_page.dart';
//import 'old/models/drinks_form_model.dart';
//import 'old/models/first_form_model.dart';
//import 'old/models/food_form_model.dart';
import 'old/pages/BMICalculatorScreen.dart';
import 'old/pages/daily_drink.dart';
import 'old/pages/daily_meal.dart';
import 'old/pages/drink_history_page.dart';
import 'old/pages/menu_page.dart';
import 'old/pages/note_page.dart';
import 'old/pages/score_result.dart';
import 'old/pages/sitemap.dart';
import 'old/pages/webview.dart';
import 'old/pages/welcome.dart';
import 'old/pages/workout.dart';
import 'old/pages/workout_result.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app_firestore_example/provider/todos.dart';

import 'page/home_page.dart';
import 'update/display.dart';
import 'update/form.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'รายการประวัติbmi';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: title,
            theme: ThemeData(
              textTheme: GoogleFonts.latoTextTheme(
                Theme.of(context).textTheme,
              ),
              primarySwatch: Colors.pink,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomePage(),
            initialRoute: '/17',
            routes: <String, WidgetBuilder>{
              '/1': (context) => Welcome(),
              '/2': (context) => BMICalculatorScreen(),
              '/3': (context) => Sitemap(),
              '/4': (context) => workout(),
              '/5': (context) => meal(),
              '/6': (context) => MenuPage(),
              '/7': (context) => SixthPage(),
              '/8': (context) => Home(),
              '/9': (context) => workout(),
              '/10': (context) => result(),
              '/11': (context) => NotePage(),
              '/12': (context) => Drinks(),
              '/13': (context) => DrinksHistory(),
              '/14': (context) => WebViewExample(),
              '/15': (context) => HomePage(),
              '/16': (context) => MyHomePage(),
              '/17': (context) => HomeScreen(),
            }),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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
/*class CheckYourBMR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFF1F1F1),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      home: Home(), //MainPage
    );
  }
}*/
