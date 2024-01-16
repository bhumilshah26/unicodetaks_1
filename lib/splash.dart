import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotbook/Login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the main screen after a specific time (e.g., 3 seconds).
    where();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/hotelgif.gif',
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,)
          ],
        ),
      ),
    );

  }

  Future<void> where() async{
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }
}
