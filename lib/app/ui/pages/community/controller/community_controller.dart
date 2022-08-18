
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/community/page/comm_detail_page.dart';
import 'package:travelidge/app/ui/pages/community/page/comm_my_page.dart';
import 'package:travelidge/app/ui/pages/community/page/comm_write_page.dart';

class CommunityController extends GetxController with SingleGetTickerProviderMixin{

  static CommunityController get to => Get.find<CommunityController>();
  late TabController tabController;
  late TabController myTabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
    myTabController = TabController(length: 2, vsync: this);
  }

  backPage(){
    Get.back();
  }

  getDetailMove(){
    Get.to(() => CommDetail());
  }

  myPageMove(){
    Get.to(() => CommMy());
  }

  writePageMove(){
    Get.to(() => CommWrite());
  }
}