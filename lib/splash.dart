import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hotbook/widgettree.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
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
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WidgetTree()),
      );
    });
  }
}
