
import 'dart:convert';
import 'package:dentalstation_app/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dentalstation_app/Designs/Onboarding/OnBoardingPage.dart';
import 'package:dentalstation_app/Models/Cart.dart';
import 'package:dentalstation_app/State/stateManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
  final storage = FlutterSecureStorage();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((x) async {
      String cartSave = await storage.read(key: cartKey);
      if (cartSave != null && cartSave.isNotEmpty) {
        final listCart = json.decode(cartSave) as List<dynamic>;
        final listCartParsed = listCart.map((e) => Cart.fromJson(e)).toList();
        if (listCartParsed != null && listCartParsed.length > 0)
          context.read(cartListProvider).state = listCartParsed;
      }
    });
  }
}

