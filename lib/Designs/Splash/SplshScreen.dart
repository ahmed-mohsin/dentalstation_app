
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dentalstation_app/Designs/Onboarding/OnBoardingPage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset(
          'assets/appIntro.gif',
          height: 500,
          width: 500,
          fit: BoxFit.contain,
        ),
        nextScreen: OnBoardingPage(),
        splashTransition: SplashTransition.fadeTransition,
        //pageTransitionType: PageTransitionType.,
        backgroundColor: Colors.white);
  }
}

