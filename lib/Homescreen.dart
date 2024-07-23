import 'package:flutter/material.dart';
import 'Calculator/basicCalculator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 11, 6, 6),
              Color.fromARGB(255, 33, 11, 11)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                height: 100.0,
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  "Beyond numbers, there's calculation",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalculatorScreen()),
                    );
                  },
                  child: Text(
                    'Calculate!',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
