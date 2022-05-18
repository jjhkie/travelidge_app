import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/binding/init_binding.dart';
import 'package:travelidge/routes/app_pages.dart';
import 'package:travelidge/routes/app_routes.dart';
import 'package:travelidge/ui/nav/nav_bottom.dart';

import 'ui/user/screen/user_page.dart';

void setupApp() {
  if (Flavor.I.isDevelopment) {
    Flavor.I.getString(Keys.apiUrl);
  }
  runApp(FlavorApp());
}

class FlavorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Travelidege',
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
