import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour, required this.child, required this.onPress});

  final Color colour;
  final Widget child;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        child: child,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: colour,
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  offset: Offset(10, 10),
                  color: Colors.black.withOpacity(0.1)),
              BoxShadow(
                  blurRadius: 3,
                  offset: Offset(-5, -5),
                  color: Colors.black.withOpacity(0.1)),
            ]),
      ),
    );
  }
}
