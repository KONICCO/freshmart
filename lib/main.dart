import 'package:bisa/buah.dart';
import 'package:flutter/material.dart';

import 'splash_screen.dart';
import 'kategori.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/buah': (BuildContext context) => Buah(),
      },
      theme: ThemeData(
        primaryColor: Color(0xFF01afbd),
      ),
      home: SplashScreen(),
    );
  }
}
