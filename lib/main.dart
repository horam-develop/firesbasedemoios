import 'dart:async';

import 'package:firesbasedmoios/crashlytics/firebaseCrashlytics.dart';
import 'package:firesbasedmoios/screen/mainScreen.dart';
import 'package:flutter/material.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true; // when ture means you can see the report in pannel in the debug mode
  FlutterError.onError = Crashlytics.instance.recordFlutterError;  // Pass all uncaught errors to Crashlytics.
 runZoned<Future<void>>(() async { // create a zone to catch all of the async requests from the app and send it to the server
    runApp(MyApp());
  }, onError: Crashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(title: 'firesbasedmoios main screen'),
    );
  }
}

