import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:delivery_app/constants.dart';
import 'package:delivery_app/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      backgroundColor: kPrimaryColor,
        splash: Center(
          child: Lottie.asset('assets/splash_screen/splash.json'),
        ),
        nextScreen: RegisterScreen(),
        splashIconSize: size.width*0.4,
        
        duration: 4000,);
  }
}
