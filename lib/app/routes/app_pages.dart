import 'package:get/get.dart';
import 'package:travelidge/app/binding/write_binding.dart';
import 'package:travelidge/app/routes/app_routes.dart';
import 'package:travelidge/app/ui/nav/screen/nav_bottom.dart';
import 'package:travelidge/app/ui/write/page/writing_page.dart';

class AppPages{
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const Page()),
    GetPage(name: Routes.WRITING, page: () =>  Writing(),binding:WriteBinding())
  ];
}