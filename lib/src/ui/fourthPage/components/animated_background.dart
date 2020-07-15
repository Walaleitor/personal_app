import 'package:flutter/material.dart';

class _AnimatedBackground extends StatefulWidget {
  @override
  __AnimatedBackgroundState createState() => __AnimatedBackgroundState();
}

class __AnimatedBackgroundState extends State<_AnimatedBackground>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> axisX;
  Animation<double> axisX2;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    axisX = Tween(begin: 0.0, end: 1.0).animate(controller);
    axisX2 = Tween(begin: 1.0, end: 0.0).animate(controller);
    controller.forward();
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) controller.reverse();
      if (controller.status == AnimationStatus.dismissed) controller.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return CustomPaint(
            painter: _AnimatedBackgroundPainter(axisX.value, axisX2.value),
          );
        },
      ),
    );
  }
}

class _AnimatedBackgroundPainter extends CustomPainter {
  final double axisX;
  final double axisX2;

  _AnimatedBackgroundPainter(this.axisX, this.axisX2);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = 10.0
      ..color = Colors.white38
      ..style = PaintingStyle.fill;
    final paint2 = new Paint()
      ..strokeWidth = 10.0
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = new Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * axisX, size.height * 0.6, size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.7);

    final path2 = new Path();
    path2.moveTo(0, size.height * 0.8);
    path2.quadraticBezierTo(
        size.width * axisX2, size.height * 0.6, size.width, size.height * 0.6);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.lineTo(0, size.height * 0.7);

    canvas.drawPath(path2, paint2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_AnimatedBackgroundPainter oldDelegate) => true;
}
