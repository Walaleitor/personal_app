import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  final String direction;
  final Function action;
  final bool visible;

  Arrow({this.direction = 'up', this.action, this.visible = true});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Visibility(
      visible: visible,
      child: GestureDetector(
        onTap: action,
        child: Container(
          padding: EdgeInsets.all(5.0),
          height: 25.0,
          width: size.width * 0.2,
          child: CustomPaint(
            painter: _ArrowPainter(direction: direction),
          ),
        ),
      ),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  final String direction;

  _ArrowPainter({this.direction = 'up'});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.white54
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    final pathDown = new Path();
    pathDown.lineTo(size.width * 0.5, size.height);
    pathDown.lineTo(size.width, 0);

    final pathUp = new Path();
    pathUp.moveTo(0, size.height);
    pathUp.lineTo(size.width * 0.5, 0);
    pathUp.lineTo(size.width, size.height);

    if (direction == 'up') canvas.drawPath(pathUp, paint);
    if (direction == 'down') canvas.drawPath(pathDown, paint);
  }

  @override
  bool shouldRepaint(_ArrowPainter oldDelegate) => false;
}
