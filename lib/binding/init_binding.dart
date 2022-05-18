
import 'package:get/get.dart';
import 'package:travelidge/controller/declare_controller.dart';
import 'package:travelidge/controller/infinite_scroll_controller.dart';
import 'package:travelidge/controller/nav_controller.dart';
import 'package:travelidge/controller/notice_controller.dart';
import 'package:travelidge/data/provider/api.dart';
import 'package:travelidge/data/repository/notice_repository.dart';
import 'package:travelidge/data/repository/user_repository.dart';

class InitBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(NavController());
    Get.put(NoticeController(NoticeRepository(ApiClient())));
    Get.put(DeclareController());
    Get.put(InfiniteScrollController(UserRepository(ApiClient())));

  }

}