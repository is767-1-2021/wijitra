import 'package:flutter/material.dart';
import 'package:team_app/first_page.dart';
import 'package:team_app/jirutcha/Pages/FirstPage.dart';
import 'package:team_app/napassara/Pages/first_page.dart';
import 'package:team_app/phattarawadee/pages/menu_page.dart';
import 'BMICalculatorScreen.dart';
import 'Home.dart';

class Menu extends StatelessWidget {
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstPagew()));
                    },
                    icon: Icon(
                      Icons.forward,
                      color: Colors.pink,
                    ),
                    label: Text("BMR"),
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
                    label: Text("FirstPagej"),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => First_Page()));
                    },
                    icon: Icon(
                      Icons.wine_bar,
                      color: Colors.pink,
                    ),
                    label: Text("FirstPageN"),
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
                          MaterialPageRoute(builder: (context) => MenuPage()));
                    },
                    icon: Icon(
                      Icons.food_bank,
                      color: Colors.pink,
                    ),
                    label: Text("MenuPage"),
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
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    icon: Icon(
                      Icons.umbrella,
                      color: Colors.pink,
                    ),
                    label: Text("home"),
                    style: TextButton.styleFrom(
                      primary: Colors.orangeAccent,
                      backgroundColor: Colors.green[900],
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
