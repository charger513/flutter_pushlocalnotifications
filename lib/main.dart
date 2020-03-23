import 'package:flutter/material.dart';
import 'package:flutter_pushlocalnotifications/src/pages/home_page.dart';
import 'package:flutter_pushlocalnotifications/src/pages/mensaje_page.dart';
import 'package:flutter_pushlocalnotifications/src/providers/push_notifications_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    final PushNotificationProvider pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();

    pushProvider.mensajes.listen((argumento) {
      // Navigator.pushNamed(context, 'mensaje');
      print('Arguemnto del push');
      print(argumento);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Local',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mensaje': (BuildContext context) => MensajePage(),
      },
    );
  }
}