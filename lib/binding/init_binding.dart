

import 'package:get/get.dart';
import 'package:travelidge/controller/nav_controller.dart';

class InitBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(NavController());
  }

}