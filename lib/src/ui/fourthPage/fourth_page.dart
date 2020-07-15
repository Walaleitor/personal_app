import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_app/src/ui/commons/common_body.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // _AnimatedBackground(),
        CommonBody(
            child: Center(
          child: ColorizeAnimatedTextKit(
              repeatForever: true,
              text: [
                "Adiós",
                "Sayonara",
                "Goodbye",
              ],
              textStyle: GoogleFonts.ptSans(fontSize: 60.0),
              colors: [
                Colors.purple,
                Colors.blue,
                Colors.yellow,
                Colors.red,
              ],
              textAlign: TextAlign.center,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
        )),
      ],
    );
  }
}
