import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'AdvancedOperationsDialog.dart' as advanced;
import 'trigoLogic.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = "";
  String _result = "0";
  bool is_Degree = true; // Toggle for degree/radian mode

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _input = "";
        _result = "";
      } else if (buttonText == "=") {
        try {
          // Handle custom logarithms
          String modifiedInput = _input
              .replaceAllMapped(
                RegExp(r'log\(([^)]+)\)'),
                (match) {
                  final value = match.group(1);
                  return 'ln($value) / ln(10)';
                },
              )
              .replaceAllMapped(
                RegExp(r'antilog\(([^)]+)\)'),
                (match) {
                  final value = match.group(1);
                  return 'pow(10, $value)';
                },
              )
              .replaceAll('×', '*')
              .replaceAll('÷', '/');
          if (is_Degree) {
            modifiedInput = modifiedInput.replaceAllMapped(
                RegExp(r'(sin|cos|tan)\((.*?)\)'),
                (Match m) =>
                    '${m.group(1)}(${_convertToRadians(double.parse(m.group(2)!))})');
          }

          Parser p = Parser();
          ContextModel cm = ContextModel();
          cm.bindFunction(AsinFunction());
          cm.bindFunction(AcosFunction());
          cm.bindFunction(AtanFunction());
          Expression exp = p.parse(modifiedInput);
          double eval = exp.evaluate(EvaluationType.REAL, cm);

          _result = eval.toString();
        } catch (e) {
          _result = 'Error';
        }
      } else if (buttonText == 'DEG') {
        is_Degree = true;
      } else if (buttonText == 'RAD') {
        is_Degree = false;
      } else {
        _input += buttonText;
      }
    });
  }

  double _convertToRadians(double degrees) {
    return degrees * (3.14159265358979323846 / 180.0);
  }

  void onDrawerButtonPressed(String buttonText) {
    buttonPressed(buttonText);
  }

  void _showAdvancedOperationsDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return advanced.AdvancedOperationsDialog(
            onButtonPressed: onDrawerButtonPressed);
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1.0, -1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Scientific Calculator',
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: _showAdvancedOperationsDialog,
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              _input.isEmpty ? "0" : _input,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              _result,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Radians',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Switch(
                value: is_Degree,
                onChanged: (value) {
                  setState(() {
                    is_Degree = value;
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
              Text(
                'Degrees',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          Column(children: [
            Row(children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/"),
            ]),
            Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("*"),
            ]),
            Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-"),
            ]),
            Row(children: [
              buildButton("."),
              buildButton("0"),
              buildButton("."),
              buildButton("+"),
            ]),
            Row(children: [
              buildButton("C"),
              buildButton("="),
              buildButton(")"),
              buildButton("(")
            ]),
          ])
        ],
      ),
    );
  }

  Widget buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 9, 9, 9),
                Color.fromARGB(255, 8, 8, 8),
                Color.fromARGB(255, 6, 6, 6)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(21.0),
              backgroundColor: Color.fromARGB(255, 18, 7, 7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () => buttonPressed(text),
          ),
        ),
      ),
    );
  }
}
