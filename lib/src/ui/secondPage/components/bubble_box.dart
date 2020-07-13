import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//COLORS 0xC7EFA8B3 0xC7EFB599 0xC7D4B887

class BubbleBox extends StatelessWidget {
  final Color color;
  final String titleText;
  final String descriptionText;

  const BubbleBox(
      {@required this.color, this.titleText = '', this.descriptionText = ''});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.width * 0.3,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(30.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment(-0.9, 0),
              child: Text(
                titleText,
                style: GoogleFonts.firaCode(
                    fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              descriptionText,
              style: GoogleFonts.firaCode(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
