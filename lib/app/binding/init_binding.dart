
import 'package:get/get.dart';
import 'package:travelidge/app/data/provider/api.dart';
import 'package:travelidge/app/data/repository/home_repository.dart';
import 'package:travelidge/app/data/repository/notice_repository.dart';
import 'package:travelidge/app/ui/pages/home/controller/home_controller.dart';
import 'package:travelidge/app/ui/pages/nav/controller/nav_controller.dart';
import 'package:travelidge/app/ui/pages/notice/controller/notice_controller.dart';


class InitBinding implements Bindings{
  @override
  void dependencies() {
   //Get.put(NavController());
    //Get.put(FcmController());
    Get.lazyPut(() => NoticeController(NoticeRepository(ApiClient())));
    //Get.lazyPut(() => DeclareController());
    //Get.lazyPut(() => ChatListController());
    Get.lazyPut(() => NavController());
    //Get.lazyPut(() => WriteController());
    Get.lazyPut(() => HomeController(HomeRepository(ApiClient())));
    //Get.lazyPut(() => InfiniteScrollController(UserRepository(ApiClient())));
  }

}