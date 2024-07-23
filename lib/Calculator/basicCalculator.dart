// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as Math;
import 'dart:math'; // Import for log and exp functions
import 'Drawer.dart';
import 'AdvancedOperationsDialog.dart' as advanced;
import 'logarithms_drawer.dart'; // Import the LogarithmDrawer
import 'package:math_expressions/math_expressions.dart' as math_pkg;
import 'package:expressions/expressions.dart' as exp_pkg;

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = "";
  String _result = "0";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = "";
  double _customBase = 10; // Default base value for custom log

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _input = "";
        _result = "";
      } else if (buttonText == "=") {
        try {
          Parser p = Parser();
          Expression exp = p.parse(_input
              .replaceAll('×', '*')
              .replaceAll('÷', '/')); // Replace symbols if necessary
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          _result = eval.toString();
        } catch (e) {
          _result = "Error";
        }
      } else {
        _input += buttonText;
      }
    });
  }

  void _evaluateLogarithm() {
    try {
      // Debugging statement
      print('Input: 100');

      if (_input.startsWith("log(")) {
        // Extract the number part for log calculation
        String numberPart = _input.substring(4, _input.length - 1);
        double number = double.parse(numberPart);
        if (number > 0) {
          double result = log(number) / log(10); // Base-10 logarithm
          _result = result.toString();
        } else {
          _result = "Error: Non-positive number for log";
        }
      } else if (_input.startsWith("ln(")) {
        // Extract the number part for ln calculation
        String numberPart = _input.substring(3, _input.length - 1);
        double number = double.parse(numberPart);
        if (number > 0) {
          double result = log(number); // Natural logarithm
          _result = result.toString();
        } else {
          _result = "Error: Non-positive number for ln";
        }
      } else if (_input.startsWith("antilog(")) {
        // Extract the number part for antilog calculation
        String numberPart = _input.substring(8, _input.length - 1);
        double number = double.parse(numberPart);
        double result = exp(number); // Antilog (base e)
        _result = result.toString();
      } else if (_input.startsWith("customLog(")) {
        // Extract the number part for custom base logarithm
        String numberPart = _input.substring(10, _input.length - 1);
        double number = double.parse(numberPart);
        if (number > 0 && _customBase > 0) {
          double result =
              log(number) / log(_customBase); // Custom base logarithm
          _result = result.toString();
        } else {
          _result = "Error: Invalid number or base for customLog";
        }
      } else {
        _result = "Error: Invalid input";
      }

      // Debugging statement
      print('Result: $_result');
      _input = _result; // Update input to show result
    } catch (e) {
      // Handle parsing errors or any other unexpected issues
      _result = "Error: ${e.toString()}";
    }
  }

  void _onEvaluate() {
    setState(() {
      try {
        final expression = exp_pkg.Expression.parse(_input);
        final evaluator = const exp_pkg.ExpressionEvaluator();
        final result = evaluator.eval(expression, {});

        _result = result.toString();
      } catch (e) {
        _result = "Error";
      }
    });
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

  // void _showCustomBaseDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.black,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15.0),
  //         ),
  //         title:
  //             Text('Enter Base Value', style: TextStyle(color: Colors.white)),
  //         content: TextField(
  //           style: TextStyle(color: Colors.white),
  //           keyboardType: TextInputType.number,
  //           onChanged: (value) {
  //             try {
  //               _customBase = double.parse(value);
  //             } catch (e) {
  //               _customBase = 10.0; // Default value if input is invalid
  //             }
  //           },
  //           decoration: InputDecoration(
  //             hintText: "Enter base value",
  //             hintStyle: TextStyle(color: Colors.grey),
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('OK', style: TextStyle(color: Colors.white)),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               if (_input.isNotEmpty) {
  //                 try {
  //                   _num1 = double.parse(_input);
  //                   if (_num1 > 0 && _customBase > 0) {
  //                     _result = (log(_num1) / log(_customBase)).toString();
  //                     _input = _result;
  //                   } else {
  //                     _result = "Error"; // Handle log for non-positive numbers
  //                   }
  //                 } catch (e) {
  //                   _result = "Error";
  //                 }
  //               }
  //               setState(() {});
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
              buildButton("=", onPressed: _onEvaluate),
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
                Color.fromARGB(255, 30, 11, 10),
                Color.fromARGB(255, 34, 15, 15),
                Color.fromARGB(255, 32, 16, 10)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(24.0),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
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
