import 'package:flutter/material.dart';
import 'package:personal_app/src/data/models/slider_model.dart';
import 'package:personal_app/src/ui/mainPage/main_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
