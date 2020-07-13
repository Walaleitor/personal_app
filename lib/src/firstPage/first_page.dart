import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_app/src/commons/common_body.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[_background(), _Body()],
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonBody(child: Container());
  }
}

Widget _background() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/back1.jpg'), fit: BoxFit.fill)),
    child: Container(
      color: Colors.black45,
    ),
  );
}
