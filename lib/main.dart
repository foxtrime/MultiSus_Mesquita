import 'package:flutter/material.dart';
// import 'index.dart';
import 'apresenta.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xFF3E276A),
      title: 'MultiSuS Mesquita',
      home: Apresenta(),
    );
  }
}
