import 'package:flutter/material.dart';
// import 'dart:math';

class LogarithmDrawer extends StatelessWidget {
  final Function(String) onButtonPressed;

  LogarithmDrawer({required this.onButtonPressed});

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
                'Logarithm Operations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('log', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('log(');
              },
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('ln', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('ln(');
              },
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('Custom Base log',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('customLog');
              },
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('antilog(', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('antilog(');
              },
            ),
          ],
        ),
      ),
    );
  }
}
