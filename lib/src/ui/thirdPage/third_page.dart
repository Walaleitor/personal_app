import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_app/src/data/url_pages.dart';
import 'package:personal_app/src/ui/commons/common_body.dart';
import 'package:personal_app/src/ui/commons/utils.dart';
import 'package:personal_app/src/ui/thirdPage/components/big_icon.dart';
import 'package:personal_app/src/ui/thirdPage/components/small_icon.dart';

class ThirdPage extends StatelessWidget {
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
  Animation<double> translate;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    opacity = new Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.5, curve: Curves.ease)));

    translate = new Tween(begin: 10.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0, curve: Curves.elasticOut)));
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
            child: Center(
              child: Opacity(
                opacity: opacity.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _text('Aqui puedes encontrar algunos de mis proyectos'),
                    SizedBox(
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment(translate.value, 0),
                      child: BigIcon(
                        image: 'assets/images/github.png',
                        onTap: () {
                          launchURL(UrlPages.github);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment(-(translate.value), 0),
                      child: BigIcon(
                        image: 'assets/images/gitlab.png',
                        onTap: () {
                          launchURL(UrlPages.gitlab);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    _text('Tambien me puedes encontrar en mis redes sociales'),
                    SizedBox(
                      height: 20.0,
                    ),
                    _iconRow(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _text('O simplemente puedes enviarme un email'),
                    SizedBox(
                      height: 10.0,
                    ),
                    _emailText()
                  ],
                ),
              ),
            ),
          );
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

Widget _iconRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SmallIcon(
          image: 'assets/images/icon-ig.png',
          onTap: () {
            launchURL(UrlPages.instagram);
          }),
      SizedBox(
        width: 12.0,
      ),
      SmallIcon(
          image: 'assets/images/icon-fb.png',
          onTap: () {
            launchURL(UrlPages.facebook);
          }),
      SizedBox(
        width: 12.0,
      ),
      SmallIcon(
          image: 'assets/images/icon-twitter.png',
          onTap: () {
            launchURL(UrlPages.twitter);
          }),
      SizedBox(
        width: 12.0,
      ),
      SmallIcon(
          image: 'assets/images/icon-linkedin.png',
          onTap: () {
            launchURL(UrlPages.linkedin);
          }),
    ],
  );
}

Widget _emailText() {
  return Text(
    'sebanicosp@gmail.com',
    style: GoogleFonts.cabin(
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline),
  );
}
