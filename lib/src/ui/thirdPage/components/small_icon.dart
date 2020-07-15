import 'package:flutter/material.dart';

class SmallIcon extends StatelessWidget {
  final String image;
  final Function onTap;

  const SmallIcon({@required this.image, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.06,
        width: size.height * 0.06,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(image))),
      ),
    );
  }
}
