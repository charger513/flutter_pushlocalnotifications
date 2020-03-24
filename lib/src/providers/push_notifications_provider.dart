import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();

  int _contador = 0;

  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print('===== FCM Token =====');
      print(token);

      // eM97-X0OJrQ:APA91bH5bmXXID8jjbV7dFJ8RmPXcOVdm-EqKOXkhjBtYr_APuJF9JNlCpxp5UYiqpoOWngtxltsT5Duvb2_8NU2qfApfXcPey06JNMlVwBCqM1OvH-T-vZT3j-X8ekahvYd9UMiVqOf
    });

    _firebaseMessaging.configure(
      onMessage: (info) async {
        if(_contador % 2 == 0){ // Hay un bug que hace que dispare 2 notificaciones
          print('====== On Message ======');
          print(info);

          String argumento = 'no-data';
          if(Platform.isAndroid) {
            argumento = info['data']['comida'] ?? 'no-data';
          }

          _mensajesStreamController.sink.add(argumento);
          _contador++;
        }
      },
      onLaunch: (info) async {
        print('====== On Launch ======');
        print(info);
      },
      onResume: (info) async {
        print('====== On Resume ======');
        print(info);

        String argumento = 'no-data';
        if(Platform.isAndroid) {
          argumento = info['data']['comida'] ?? 'no-data';
        }

        _mensajesStreamController.sink.add(argumento);
      },
    );
  }

  dispose() {
    _mensajesStreamController?.close();
  }

}