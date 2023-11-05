import 'package:celebrare/enums/shapes.dart';
import 'package:celebrare/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

Shape selectedShape = Shape.none;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


