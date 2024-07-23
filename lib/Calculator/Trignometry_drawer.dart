import 'package:flutter/material.dart';
import 'dart:math';

class TrignometryDrawer extends StatelessWidget {
  final Function(String) onButtonPressed;

  TrignometryDrawer({required this.onButtonPressed});

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
                'Trigonometry Operations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('sin(', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('sin(');
              },
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('cos(', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('cos(');
              },
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('tan(', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('tan(');
              },
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('Sin Inverse', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('Arc Sine (asin(');
              },
            ),
          ],
        ),
      ),
    );
  }
}
