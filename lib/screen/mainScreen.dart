import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Crashlytics example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                  child: const Text('Key'),
                  onPressed: () {
                    Crashlytics.instance.setString('foo', 'bar');
                  }),
              FlatButton(
                  child: const Text('Log'),
                  onPressed: () {
                    Crashlytics.instance.log('test log');
                  }),
              FlatButton(
                  child: const Text('Crash'),
                  onPressed: () {
                    Crashlytics.instance.crash(); // use crashlytics to throw an error
                  }),
              FlatButton(
                  child: const Text('Throw Error'),
                  onPressed: () {
                    throw StateError('Uncaught error thrown by app.'); // example of throws error
                  }),
              FlatButton(
                  child: const Text('Async out of bounds'),
                  onPressed: () {
                    // Example of an exception that does not get caught
                    // by `FlutterError.onError` but is caught by the `onError` handler of
                    // `runZoned`.
                    Future<void>.delayed(const Duration(seconds: 2), () {
                      final List<int> list = <int>[];
                      print(list[100]);
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
