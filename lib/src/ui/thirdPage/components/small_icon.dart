import 'package:flutter/material.dart';

class SmallIcon extends StatelessWidget {
  final String image;

  const SmallIcon({@required this.image});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.height * 0.06,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(image))),
    );
  }
}
