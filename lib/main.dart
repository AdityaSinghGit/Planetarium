import 'package:flutter/material.dart';
import 'package:planetarium/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planetarium',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}
