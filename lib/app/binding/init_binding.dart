
import 'package:get/get.dart';
import 'package:travelidge/app/data/provider/api.dart';
import 'package:travelidge/app/data/repository/notice_repository.dart';

import 'package:travelidge/app/data/repository/user_repository.dart';
import 'package:travelidge/app/ui/pages/chat/controller/chat_controller.dart';
import 'package:travelidge/app/ui/pages/chat/controller/compress_controller.dart';
import 'package:travelidge/app/ui/pages/community/controller/community_controller.dart';

import 'package:travelidge/app/ui/pages/nav/controller/nav_controller.dart';
import 'package:travelidge/app/ui/pages/notice/controller/notice_controller.dart';
import 'package:travelidge/app/ui/pages/user/controller/user_controller.dart';


class InitBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NavController());

    Get.lazyPut(() => UserController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => CompressController());
    Get.lazyPut(() => NoticeController(NoticeRepository(ApiClient())));

    Get.lazyPut(() => CommunityController());


  }

}