

import 'package:get/get.dart';
import 'package:travelidge/app/data/provider/api.dart';
import 'package:travelidge/app/data/repository/user_repository.dart';
import 'package:travelidge/app/ui/pages/upload/controller/upload_controller.dart';

class UploadBinding extends Bindings{
  @override
  void dependencies() {
    //Get.lazyPut<UploadController>(() => UploadController());
    Get.put(UploadController(UserRepository(ApiClient())));
  }

}