import 'package:delivery_app/screens/login/login_screen.dart';
import 'package:delivery_app/screens/register/register_screen.dart';
import 'package:delivery_app/screens/splash_screen/splach_screen.dart';
import 'package:flutter/material.dart';

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
      home: SplachScreen(),
      theme: ThemeData(fontFamily: 'PatuaOne'),
      routes: {
      RegisterScreen.id:(context)=>RegisterScreen(),
      LoginScreen.id:(context)=>LoginScreen()
      },
    );
  }
}
