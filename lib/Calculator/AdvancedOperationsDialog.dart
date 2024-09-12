import 'package:flutter/material.dart';
import 'logarithms_drawer.dart';
import 'Trignometry_drawer.dart';
import 'additionalOperators.dart';

class AdvancedOperationsDialog extends StatelessWidget {
  final Function(String) onButtonPressed;

  AdvancedOperationsDialog({required this.onButtonPressed});

  void _showLogarithmDrawer(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return LogarithmDrawer(onButtonPressed: onButtonPressed);
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

  void _showTrignometryDrawer(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return TrignometryDrawer(onButtonPressed: onButtonPressed);
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

  void _showAdditionalOperators(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return AdditionalOperators(onButtonPressed: onButtonPressed);
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
                _showLogarithmDrawer(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up, color: Colors.white),
              title: Text('Additional operators',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _showAdditionalOperators(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart, color: Colors.white),
              title:
                  Text('Trigonometry', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _showTrignometryDrawer(context);
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.show_chart, color: Colors.white),
            //   title: Text('Matrix', style: TextStyle(color: Colors.white)),
            //   onTap: () {
            //     Navigator.pop(context);
            //     onButtonPressed('tan');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
