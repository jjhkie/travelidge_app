import 'package:get/get.dart';
import 'package:travelidge/app/binding/home_binding.dart';
import 'package:travelidge/app/binding/write_binding.dart';
import 'package:travelidge/app/routes/app_routes.dart';
import 'package:travelidge/app/ui/pages/nav/page/nav_bottom.dart';
import 'package:travelidge/app/ui/pages/write/page/writing_page.dart';


class AppPages{
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const Page(),binding: HomeBinding()),
    GetPage(name: Routes.WRITING, page: () =>  Writing(),binding:WriteBinding())
  ];
}