


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/binding/upload_binding.dart';
import 'package:travelidge/app/ui/pages/upload/page/upload_page.dart';

class UserController extends GetxController with SingleGetTickerProviderMixin{


  late TabController tabController;
  @override
  void onInit(){
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  uploadPageMove(){
    Get.to(()=> Upload(),binding: UploadBinding());
  }

}