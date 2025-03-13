import 'package:flutter/material.dart';
import 'package:jconverter/screen/length_screen.dart';
import 'package:jconverter/screen/splash.dart';
import 'package:jconverter/screen/temperature_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  home: Splash(),
      debugShowCheckedModeBanner: false,
      routes: {
    '/length' : (context) => LengthScreen(),
     '/temp'  : (context)  => TemperatureScreen(),
      },
    );
  }
}
