import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print('===== FCM Token =====');
      print(token);

      // eM97-X0OJrQ:APA91bH5bmXXID8jjbV7dFJ8RmPXcOVdm-EqKOXkhjBtYr_APuJF9JNlCpxp5UYiqpoOWngtxltsT5Duvb2_8NU2qfApfXcPey06JNMlVwBCqM1OvH-T-vZT3j-X8ekahvYd9UMiVqOf
    });

    _firebaseMessaging.configure(
      onMessage: (info) {
        print('====== On Message ======');
        print(info);
      },
      onLaunch: (info) {
        print('====== On Launch ======');
        print(info);
      },
      onResume: (info) {
        print('====== On Resume ======');
        print(info);
      },
    );
  }

}