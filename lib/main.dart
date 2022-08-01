
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/binding/init_binding.dart';
import 'package:travelidge/app/routes/app_pages.dart';
import 'package:travelidge/app/routes/app_routes.dart';
import 'package:travelidge/app/translations/app_translations.dart';
import 'package:travelidge/app/ui/theme/app_theme.dart';
import 'package:travelidge/app_config.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  var configuredApp = AppConfig(
    appName: 'Build flavors DEV',
    flavorName: 'dev',
    apiBaseUrl: 'http://118.67.131.249',
    child: FlavorApp(),
  );

  initializeDateFormatting().then((_) => runApp(configuredApp));
}


class FlavorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var config = AppConfig.of(context)!;
    return GetMaterialApp(
      locale: Locale('ko','KR'),
      translationsKeys: AppTranslation.translations,
      title: config.appName,
      theme: appThemeData,
      initialBinding: InitBinding(),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
