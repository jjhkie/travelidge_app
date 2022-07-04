
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/translations/languages.dart';
import 'package:travelidge/app/binding/init_binding.dart';
import 'package:travelidge/app/routes/app_pages.dart';
import 'package:travelidge/app/routes/app_routes.dart';
import 'package:travelidge/app_config.dart';


// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }
//
// void setupApp() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   //runApp으로 앱이 실행되기 전에 비동기로 지연이 되더라도 오류가 발생하지 않도록 하는 역할
//   //await Firebase.initializeApp().then((v)=> Get.put(AuthController()));
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   Get.put(AuthController());
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   runApp(FlavorApp());
// }

void main() {
  var configuredApp = AppConfig(
    appName: 'Build flavors DEV',
    flavorName: 'dev',
    apiBaseUrl: 'http://118.67.131.249',
    child: FlavorApp(),
  );

  runApp(configuredApp);
}

class FlavorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var config = AppConfig.of(context)!;
    return GetMaterialApp(
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('ko','KR'),
      title: config.appName,
      theme: ThemeData(
        fontFamily: 'AppleSDGothicNeo',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: InitBinding(),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
