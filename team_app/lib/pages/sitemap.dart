import 'package:flutter/material.dart';
import 'package:team_app/pages/score.dart';
import 'package:team_app/pages/menu_page.dart';
import 'package:team_app/pages/workout_result.dart';
import 'BMICalculatorScreen.dart';
import 'Home_menu.dart';
import 'note_result.dart';

class sitemap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BMICalculatorScreen()));
                    },
                    icon: Icon(
                      Icons.health_and_safety_sharp,
                      color: Colors.pink,
                    ),
                    label: Text("BMI"),
                    style: TextButton.styleFrom(
                      primary: Colors.orangeAccent,
                      backgroundColor: Colors.pink[900],
                      onSurface: Colors.black12,
                    )),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
              Container(
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    icon: Icon(
                      Icons.forward,
                      color: Colors.pink,
                    ),
                    label: Text("Home"),
                    style: TextButton.styleFrom(
                      primary: Colors.orangeAccent,
                      backgroundColor: Colors.purple[800],
                      onSurface: Colors.black12,
                    )),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
              Container(
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    icon: Icon(
                      Icons.local_pizza,
                      color: Colors.pink,
                    ),
                    label: Text("ประเมิณ"),
                    style: TextButton.styleFrom(
                      primary: Colors.orangeAccent,
                      backgroundColor: Colors.green[900],
                      onSurface: Colors.black12,
                    )),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
              Container(
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => result()));
                    },
                    icon: Icon(
                      Icons.wine_bar,
                      color: Colors.pink,
                    ),
                    label: Text("workout"),
                    style: TextButton.styleFrom(
                      primary: Colors.orangeAccent,
                      backgroundColor: Colors.blue[900],
                      onSurface: Colors.black12,
                    )),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
              Container(
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => noteresult()));
                    },
                    icon: Icon(
                      Icons.food_bank,
                      color: Colors.pink,
                    ),
                    label: Text("meal"),
                    style: TextButton.styleFrom(
                      primary: Colors.orangeAccent,
                      backgroundColor: Colors.redAccent,
                      onSurface: Colors.black12,
                    )),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
              Container(
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MenuPage()));
                    },
                    icon: Icon(
                      Icons.umbrella,
                      color: Colors.pink,
                    ),
                    label: Text("menu"),
                    style: TextButton.styleFrom(
                      primary: Colors.orangeAccent,
                      backgroundColor: Colors.teal[900],
                      onSurface: Colors.black12,
                    )),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "HOME",
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 56,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
