

import 'package:get/get.dart';
import 'package:travelidge/ui/write/controller/write_controller.dart';

class WriteBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WriteController>((){
      return WriteController();
    });
  }

}