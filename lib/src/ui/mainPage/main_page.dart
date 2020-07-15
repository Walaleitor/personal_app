import 'package:flutter/material.dart';
import 'package:personal_app/src/data/models/slider_model.dart';
import 'package:personal_app/src/ui/firstPage/first_page.dart';
import 'package:personal_app/src/ui/fourthPage/fourth_page.dart';
import 'package:personal_app/src/ui/secondPage/second_page.dart';
import 'package:personal_app/src/ui/thirdPage/third_page.dart';
import 'package:provider/provider.dart';

import 'components/arrow.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            PageView(
              controller: pageViewController,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                FirstPage(),
                SecondPage(),
                ThirdPage(),
                FourthPage()
              ],
            ),
            MoveArrows(
              controller: pageViewController,
            )
          ],
        ));
  }
}

class MoveArrows extends StatelessWidget {
  final PageController controller;

  const MoveArrows({@required this.controller});

  @override
  Widget build(BuildContext context) {
    double currentPage = Provider.of<SliderModel>(context).currentPage;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Arrow(
                direction: 'up',
                visible: (currentPage >= 0 - 0.5 && currentPage < 0 + 0.5)
                    ? false
                    : true,
                action: () {
                  controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
              ),
              Arrow(
                direction: 'down',
                visible: (currentPage >= 3 - 0.5 && currentPage < 3 + 0.5)
                    ? false
                    : true,
                action: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
