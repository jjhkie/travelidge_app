import 'package:get/get.dart';
import 'package:travelidge/app/data/provider/api.dart';
import 'package:travelidge/app/data/repository/detail_repository.dart';
import 'package:travelidge/app/ui/pages/detail/controller/detail_controller.dart';

class DetailBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailController>((){
      return DetailController(DetailRepository(ApiClient()));
    });
  }

}