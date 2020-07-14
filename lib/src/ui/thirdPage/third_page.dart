import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_app/src/ui/commons/common_body.dart';

class ThirdPage extends StatelessWidget {
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
    return CommonBody(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text('Aqui puedes encontrar algunos de mis proyectos')
          ],
        ),
      ),
    );
  }
}

Widget _background() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            alignment: Alignment(0.8, 0),
            image: AssetImage('assets/images/back3-minmin.jpg'),
            fit: BoxFit.cover)),
    child: Container(
      color: Colors.black45,
    ),
  );
}

Widget _text(String text) {
  return Text(
    text,
    style: GoogleFonts.cabin(
      textStyle: TextStyle(
          fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    textAlign: TextAlign.center,
  );
}
