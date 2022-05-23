import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

//https://firebase.flutter.dev/docs/messaging/notifications/
class FcmController extends GetxController {
  static FcmController get to => Get.find();

  //getx Controller를 어디서든 호출하기 위해 생성

  final Rxn<RemoteMessage> message = Rxn<RemoteMessage>();

  //Rx와 같은 기능이며 추가적으로 n은 null을 의미한다.

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<bool> initialize() async {
    // Firebase 초기화부터 해야 FirebaseMessaging 를 사용할 수 있다.
    await Firebase.initializeApp();

    var token = await FirebaseMessaging.instance.getToken();
    print(token);

    // Android 에서는 별도의 확인 없이 리턴되지만, requestPermission()을 호출하지 않으면 수신되지 않는다.
    await FirebaseMessaging.instance.requestPermission(
        alert: true,
        //사용자에게 알림을 표시할 것인지
        announcement: true,
        //AirPod에 연결되었을 때 알림 설정
        badge: true,
        //읽지 않은 알림이 있을 때 아이콘 옆에 알림점이 표시될 지 여부 설정
        carPlay: true,
        //차량 장비에 연결되었을 때 알림 설정  ( 추가적인 정보 필요 )
        criticalAlert: true,
        // ( 추가적인 정보 필요 )
        provisional: true,
        //임시권한이 부여되는지 여부를 설정
        sound: true
        //장치에 알림이 표시될 때 사운드가 들리게 할 것인지 설정
        );

    //패키지 flutter_local_notifications를 사용하여 채널 중요도 변경
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', //임의 id
      'High Importance Notifications', //설정에 보일 채널명
      importance: Importance.max,
    );
    //기기에서 채널을 생성해준다.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage rm) {
      message.value = rm;
      RemoteNotification? notification = rm.notification;
      AndroidNotification? android = rm.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: android.smallIcon,
                ),
          ),
        );
      }
    });
    return true;
  }
}
