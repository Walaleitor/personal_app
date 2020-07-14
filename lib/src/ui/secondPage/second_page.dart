import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_app/src/ui/commons/common_body.dart';
import 'package:personal_app/src/ui/secondPage/components/bubble_box.dart';

class SecondPage extends StatelessWidget {
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
        child: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _firstText(),
            SizedBox(
              height: 20.0,
            ),
            _seccondText(),
            SizedBox(
              height: 20.0,
            ),
            BubbleBox(
              color: Color(0xC7EFA8B3),
              titleText: 'Backend',
              descriptionText: 'Nodejs - Express - MongoDB - Postgresql',
            ),
            SizedBox(
              height: 20.0,
            ),
            BubbleBox(
              color: Color(0xC7EFB599),
              titleText: 'Frontend',
              descriptionText: 'Me siento comodo desarrollando con React',
            ),
            SizedBox(
              height: 20.0,
            ),
            BubbleBox(
              color: Color(0xC7D4B887),
              titleText: 'Mobile',
              descriptionText:
                  'Preferentemente prefiero desarrollar en Flutter, pero tambien desarrollo en Android Nativo',
            ),
          ],
        ),
      ),
    ));
  }
}

Widget _background() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            alignment: Alignment(0.8, 0),
            image: AssetImage('assets/images/back2-minmin.jpg'),
            fit: BoxFit.cover)),
    child: Container(
      color: Colors.black45,
    ),
  );
}

Widget _firstText() {
  return Text(
    'Me gusta aprender constantemente cosas nuevas',
    textAlign: TextAlign.center,
    style: GoogleFonts.firaCode(fontSize: 20.0, color: Colors.white),
  );
}

Widget _seccondText() {
  return Text(
    'Actualmente mi Stack preferido es el siguiente',
    textAlign: TextAlign.center,
    style: GoogleFonts.firaCode(fontSize: 20.0, color: Colors.white),
  );
}
