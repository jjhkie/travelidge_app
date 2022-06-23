import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app_config.dart';
import 'package:travelidge/binding/init_binding.dart';
import 'package:travelidge/firebase_options.dart';
import 'package:travelidge/routes/app_pages.dart';
import 'package:travelidge/ui/login/controller/auth_controller.dart';
import 'package:travelidge/routes/app_routes.dart';
import 'package:travelidge/ui/nav/screen/nav_bottom.dart';
import 'package:travelidge/ui/sign/screen/login_main_page.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void setupApp() async{

  WidgetsFlutterBinding.ensureInitialized();
  //runApp으로 앱이 실행되기 전에 비동기로 지연이 되더라도 오류가 발생하지 않도록 하는 역할
  //await Firebase.initializeApp().then((v)=> Get.put(AuthController()));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(FlavorApp());
}

class FlavorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var config = AppConfig.of(context)!;
    return GetMaterialApp(
      title: config.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: InitBinding(),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
