import 'package:flutter/material.dart';
// import 'dart:math';

class AdditionalOperators extends StatelessWidget {
  final Function(String) onButtonPressed;

  AdditionalOperators({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Additonal Operators',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('exponent', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('^');
              },
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('Factorial', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('!');
              },
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('Square root', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('sqrt(');
              },
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('Modulus', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('%');
              },
            ),
          ],
        ),
      ),
    );
  }
}
