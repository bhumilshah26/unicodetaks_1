import 'package:hotbook/Hotelui/hoteluihome.dart';
import 'auth.dart';
import 'package:hotbook/SignIn.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
         return const HomePageUI();
          } else {
            return const LoginPage();
          }
        });
  }
}
