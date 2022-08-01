

import 'package:get/get.dart';
import 'package:travelidge/app/data/provider/api.dart';
import 'package:travelidge/app/data/repository/home_repository.dart';
import 'package:travelidge/app/ui/pages/home/controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(HomeRepository(ApiClient())));
  }

}