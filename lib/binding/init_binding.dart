
import 'package:get/get.dart';
import 'package:travelidge/ui/declare/controller/declare_controller.dart';
import 'package:travelidge/controller/fcm_controller.dart';
import 'package:travelidge/ui/home/controller/home_controller.dart';
import 'package:travelidge/controller/infinite_scroll_controller.dart';
import 'package:travelidge/ui/nav/controller/nav_controller.dart';
import 'package:travelidge/ui/notice/controller/notice_controller.dart';
import 'package:travelidge/data/provider/api.dart';
import 'package:travelidge/data/repository/home_repository.dart';
import 'package:travelidge/data/repository/notice_repository.dart';
import 'package:travelidge/data/repository/user_repository.dart';
import 'package:travelidge/ui/chat_list/controllers/chat_list_controller.dart';

class InitBinding implements Bindings{
  @override
  void dependencies() {
   //Get.put(NavController());
    Get.put(FcmController());
    Get.lazyPut(() => NoticeController(NoticeRepository(ApiClient())));
    Get.lazyPut(() => DeclareController());
    Get.lazyPut(() => ChatListController());
    Get.lazyPut(() => NavController());
    Get.lazyPut(() => HomeController(HomeRepository(ApiClient())));
    Get.lazyPut(() => InfiniteScrollController(UserRepository(ApiClient())));
  }

}