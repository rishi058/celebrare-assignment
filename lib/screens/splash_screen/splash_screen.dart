import 'dart:async';

import 'package:celebrare/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void fun() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    fun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: const AssetImage('assets/splash_logo.png'),
              height: 0.1*h,
              width: 0.3*w,
            ),
            Text('Celebrare',style: TextStyle(fontFamily: 'DancingScript', color: Colors.grey[600], fontSize: 55), textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
