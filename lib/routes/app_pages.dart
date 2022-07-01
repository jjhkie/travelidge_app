import 'package:get/get.dart';
import 'package:travelidge/binding/write_binding.dart';
import 'package:travelidge/routes/app_routes.dart';
import 'package:travelidge/ui/nav/screen/nav_bottom.dart';
import 'package:travelidge/ui/write/page/writing_page.dart';

class AppPages{
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const Page()),
    GetPage(name: Routes.WRITING, page: () => const Writing(),binding:WriteBinding())
  ];
}