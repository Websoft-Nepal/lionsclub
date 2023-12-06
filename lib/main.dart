import 'package:flutter/material.dart';
import 'package:lionsclub/Home/slider.dart';

import 'Home/home.dart';
const Color pColor = Color(0xFFFCCB08);
const Color sColor = Color(0xFF11468F);
const Color tColor = Color(0xFF141414);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'LEO CLUB',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFCCB08)),
        primaryColor: pColor,
        useMaterial3: true,

      ),
      home: Home1(),
    );
  }
}

