import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/cal_class_model.dart';
import 'provider/calculator_provider01.dart';
import 'screens/history_cal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CalculatorProvider01(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCULATOR',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyCalculatorPage(title: 'Standard'),
      routes: <String, WidgetBuilder>{
        '/1': (context) => MyApp(),
        '/2': (context) => HistoryCal(),
      },
    );
  }
}

class MyCalculatorPage extends StatefulWidget {
  MyCalculatorPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyCalculatorPageState createState() => _MyCalculatorPageState();
}

class _MyCalculatorPageState extends State<MyCalculatorPage> {
  String? answer;
  String? answerTemp;
  String? inputFull;
  String? operator;
  bool? calculateMode;

  @override
  void initState() {
    answer = "0";
    operator = "";
    answerTemp = "";
    inputFull = "";
    calculateMode = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF141A2F),
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryCal(),
                ),
              );
            },
            icon: Icon(Icons.restore),
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          buildAnswerWidget(),
          buildNumPadWidget(),
        ],
      )),
    );
  }

  Widget buildAnswerWidget() {
    return Expanded(
        child: Container(
            padding: EdgeInsets.all(16),
            color: Color(0xFF141A2F),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(inputFull.toString() + " " + operator.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text(answer.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold))
                    ]))));
  }

  Widget buildNumPadWidget() {
    return Container(
        color: Color(0xFF090E1C),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(children: <Widget>[
              buildNumberButton("%", numberButton: false, onTap: () {
                addOperatorToAnswer("%");
              }),
              buildNumberButton("CE", numberButton: false, onTap: () {
                clearAnswer();
              }),
              buildNumberButton("C", numberButton: false, onTap: () {
                clearAll();
              }),
              buildNumberButton("⌫", numberButton: false, onTap: () {
                removeAnswerLast();
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("1/x", numberButton: false, onTap: () {
                clearAnswer();
              }),
              buildNumberButton("x²", numberButton: false, onTap: () {
                addOperatorToAnswer("x²");
              }),
              buildNumberButton("²√X", numberButton: false, onTap: () {
                clearAnswer();
              }),
              buildNumberButton("÷", numberButton: false, onTap: () {
                addOperatorToAnswer("÷");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("7", onTap: () {
                addNumberToAnswer(7);
              }),
              buildNumberButton("8", onTap: () {
                addNumberToAnswer(8);
              }),
              buildNumberButton("9", onTap: () {
                addNumberToAnswer(9);
              }),
              buildNumberButton("×", numberButton: false, onTap: () {
                addOperatorToAnswer("×");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("4", onTap: () {
                addNumberToAnswer(4);
              }),
              buildNumberButton("5", onTap: () {
                addNumberToAnswer(5);
              }),
              buildNumberButton("6", onTap: () {
                addNumberToAnswer(6);
              }),
              buildNumberButton("−", numberButton: false, onTap: () {
                addOperatorToAnswer("-");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("1", onTap: () {
                addNumberToAnswer(1);
              }),
              buildNumberButton("2", onTap: () {
                addNumberToAnswer(2);
              }),
              buildNumberButton("3", onTap: () {
                addNumberToAnswer(3);
              }),
              buildNumberButton("+", numberButton: false, onTap: () {
                addOperatorToAnswer("+");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("+/-", numberButton: false, onTap: () {
                toggleNegative();
              }),
              buildNumberButton("0", onTap: () {
                addNumberToAnswer(0);
              }),
              buildNumberButton(".", numberButton: false, onTap: () {
                addDotToAnswer();
              }),
              buildNumberButton("=", numberButton: false, onTap: () {
                calculate();
              }),
            ]),
          ],
        ));
  }

  void toggleNegative() {
    setState(() {
      if (answer!.contains("-")) {
        answer = answer!.replaceAll("-", "");
      } else {
        answer = "-" + answer.toString();
      }
    });
  }

  void clearAnswer() {
    setState(() {
      answer = "0";
    });
  }

  void clearAll() {
    setState(() {
      answer = "0";
      inputFull = "";
      calculateMode = false;
      operator = "";
    });
  }

  void calculate() {
    setState(() {
      if (calculateMode!) {
        bool decimalMode = false;
        double value = 0;
        if (answer!.contains(".") || answerTemp!.contains(".")) {
          decimalMode = true;
        }

        if (operator == "+") {
          value = (double.parse(answerTemp!) + double.parse(answer!));
        } else if (operator == "-") {
          value = (double.parse(answerTemp!) - double.parse(answer!));
        } else if (operator == "×") {
          value = (double.parse(answerTemp!) * double.parse(answer!));
        } else if (operator == "÷") {
          value = (double.parse(answerTemp!) / double.parse(answer!));
        } else if (operator == "%") {
          value = (double.parse(answerTemp!) / 100);
        } else if (operator == "x²") {
          value = (double.parse(answerTemp!) * double.parse(answerTemp!));
        }

        Cal cal = Cal(answerTemp, value.toString(), answer, operator);

        CalculatorProvider01().AddCal(cal);

        if (!decimalMode) {
          answer = value.toInt().toString();
        } else {
          answer = value.toString();
        }

        calculateMode = false;
        operator = "";
        answerTemp = "";
        inputFull = "";
      }
    });
  }

  void addOperatorToAnswer(String op) {
    setState(() {
      if (answer != "0" && !calculateMode!) {
        calculateMode = true;
        answerTemp = answer;
        inputFull = inputFull.toString() + operator! + " " + answerTemp!;
        operator = op;
        answer = "0";
      } else if (calculateMode!) {
        if (answer!.isNotEmpty) {
          calculate();
          answerTemp = answer;
          inputFull = "";
          operator = "";
        } else {
          operator = op;
        }
      }
    });
  }

  void addDotToAnswer() {
    setState(() {
      if (!answer!.contains(".")) {
        answer = answer.toString() + ".";
      }
    });
  }

  void addNumberToAnswer(int number) {
    setState(() {
      if (number == 0 && answer == "0") {
        // Not do anything.
      } else if (number != 0 && answer == "0") {
        answer = number.toString();
      } else {
        answer = answer.toString() + number.toString();
      }
    });
  }

  void removeAnswerLast() {
    if (answer == "0") {
      // Not do anything.
    } else {
      setState(() {
        if (answer!.length > 1) {
          answer = answer!.substring(0, answer!.length - 1);
          if (answer!.length == 1 && (answer == "." || answer == "-")) {
            answer = "0";
          }
        } else {
          answer = "0";
        }
      });
    }
  }

  Widget buildNumberButton(String str,
      {required Function() onTap, bool numberButton = true}) {
    Widget widget;
    if (numberButton) {
      widget = Container(
          margin: EdgeInsets.all(1),
          child: Material(
              color: Color(0xFF090E1C),
              child: InkWell(
                  onTap: onTap,
                  splashColor: Colors.blue,
                  child: Container(
                      height: 70,
                      child: Center(
                          child: Text(str,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold)))))));
    } else {
      widget = Container(
          margin: EdgeInsets.all(1),
          child: Material(
              color: Color(0xFF090E1C),
              child: InkWell(
                  onTap: onTap,
                  splashColor: Colors.blue,
                  child: Container(
                      height: 70,
                      child: Center(
                          child: Text(str,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 28)))))));
    }

    return Expanded(child: widget);
  }
}
