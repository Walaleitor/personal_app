import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final double diameter;

  const CircularAvatar({this.diameter = 200.0});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: diameter,
      width: diameter,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Center(
        child: Container(
          height: diameter - 10,
          width: diameter - 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('assets/images/avatar.jpg'))),
        ),
      ),
    ));
  }
}
