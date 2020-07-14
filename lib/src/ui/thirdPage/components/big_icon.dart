import 'package:flutter/material.dart';

class BigIcon extends StatelessWidget {
  final String image;

  const BigIcon({@required this.image});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      height: size.height * 0.12,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(image))),
    );
  }
}
