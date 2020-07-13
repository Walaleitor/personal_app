import 'package:flutter/material.dart';

import 'components/arrow.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[MoveArrows()],
        ));
  }
}

class MoveArrows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Arrow(
                direction: 'up',
              ),
              Arrow(
                direction: 'down',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PagesChangler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
