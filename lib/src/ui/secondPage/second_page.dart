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

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> opacity1;
  Animation<double> opacity2;
  Animation<double> opacity3;
  Animation<double> opacity4;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    opacity1 = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.25, curve: Curves.ease)));

    opacity2 = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.25, 0.5, curve: Curves.ease)));

    opacity3 = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.5, 0.75, curve: Curves.ease)));

    opacity4 = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.75, 1.0, curve: Curves.ease)));

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
          return CommonBody(
              child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Opacity(opacity: opacity1.value, child: _firstText()),
                  SizedBox(
                    height: 20.0,
                  ),
                  Opacity(opacity: opacity1.value, child: _seccondText()),
                  SizedBox(
                    height: 20.0,
                  ),
                  Opacity(
                    opacity: opacity2.value,
                    child: BubbleBox(
                      color: Color(0xC7EFA8B3),
                      titleText: 'Backend',
                      descriptionText:
                          'Nodejs - Express - MongoDB - Postgresql',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Opacity(
                    opacity: opacity3.value,
                    child: BubbleBox(
                      color: Color(0xC7EFB599),
                      titleText: 'Frontend',
                      descriptionText:
                          'Me siento comodo desarrollando con React',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Opacity(
                    opacity: opacity4.value,
                    child: BubbleBox(
                      color: Color(0xC7D4B887),
                      titleText: 'Mobile',
                      descriptionText:
                          'Preferentemente prefiero desarrollar en Flutter, pero tambien desarrollo en Android Nativo',
                    ),
                  ),
                ],
              ),
            ),
          ));
        });
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
