import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:personal_app/src/ui/commons/common_body.dart';
import 'package:personal_app/src/ui/firstPage/components/circular_avatar.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[_background(), _Body()],
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacity;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    opacity = new Tween(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Opacity(opacity: opacity.value, child: child);
      },
      child: CommonBody(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _firstText(),
          SizedBox(
            height: 30.0,
          ),
          CircularAvatar(
            diameter: 150.0,
          ),
          SizedBox(
            height: 50.0,
          ),
          _secondText(),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'const saludo = () => { \n  console.log("Hello friend!")\n}',
            style: GoogleFonts.firaCode(
              textStyle: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            textAlign: TextAlign.start,
          )
        ],
      ))),
    );
  }
}

Widget _background() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/back1-minmin.jpg'),
            fit: BoxFit.fill)),
    child: Container(
      color: Colors.black54,
    ),
  );
}

Widget _firstText() {
  return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          style: GoogleFonts.firaCode(
            fontSize: 20.0,
          ),
          children: <TextSpan>[
            TextSpan(text: 'Hola! Mi nombre es '),
            TextSpan(
                text: 'Sebastián',
                style: GoogleFonts.headlandOne(
                    fontSize: 25.0, color: Colors.amberAccent))
          ]));
}

Widget _secondText() {
  return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          style: GoogleFonts.firaCode(
            fontSize: 20.0,
          ),
          children: <TextSpan>[
            TextSpan(text: 'Soy '),
            TextSpan(
                text: 'Desarrollador de Software',
                style: GoogleFonts.headlandOne(
                    fontSize: 25.0, color: Colors.amberAccent))
          ]));
}
