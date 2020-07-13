import 'package:flutter/material.dart';

class CommonBody extends StatelessWidget {
  final Widget child;

  const CommonBody({@required this.child});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
          child: Container(
        constraints: BoxConstraints(
            maxWidth: size.width * 0.9,
            maxHeight: size.height - size.height * 0.2),
        color: Colors.white30,
        child: child,
      )),
    );
  }
}
