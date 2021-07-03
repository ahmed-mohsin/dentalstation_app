import 'dart:async';
import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'Designs/Splash/SplshScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  FCMConfig.instance.init(onBackgroundMessage:_firebaseMessagingBackgroundHandler);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runZonedGuarded(() {
    runApp(ProviderScope(child: App()));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
  FCMConfig.messaging.getToken().then((token) {
    print(token);
  });
}

FirebaseAnalytics analytics = FirebaseAnalytics();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      builder: EasyLoading.init(),
      title: 'Dental Station',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 16,
            height: 1.3,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 18,
            height: 1.2,
          ),
          button: TextStyle(color: Colors.black),
          headline1: TextStyle(
              color: Colors.black, fontSize: 10, fontFamily: 'Poppins'),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
