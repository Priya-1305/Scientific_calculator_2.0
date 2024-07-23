import 'package:flutter/material.dart';

class AdvancedOperationsDialog extends StatelessWidget {
  final Function(String) onButtonPressed;

  AdvancedOperationsDialog({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Advanced Operations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exposure, color: Colors.white),
              title: Text('Logarithm', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('log');
              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up, color: Colors.white),
              title: Text('Exponential', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('exp');
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart, color: Colors.white),
              title:
                  Text('Trigonometry', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('sin');
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart, color: Colors.white),
              title: Text('Matrix', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                onButtonPressed('tan');
              },
            ),
          ],
        ),
      ),
    );
  }
}
