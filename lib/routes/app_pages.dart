import 'package:get/get.dart';
import 'package:travelidge/routes/app_routes.dart';
import 'package:travelidge/ui/nav/screen/nav_bottom.dart';

class AppPages{
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => page())
  ];
}