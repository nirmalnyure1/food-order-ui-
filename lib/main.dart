import 'package:flutter/material.dart';

import 'screen/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}
