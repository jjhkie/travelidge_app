import 'package:get/get.dart';
import 'package:travelidge/app/routes/app_routes.dart';
import 'package:travelidge/app/ui/pages/write/controller/write_controller.dart';

enum RouteName { home, community,write,chat, user }

class NavController extends GetxService {
  static NavController get to => Get.find();

  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    if(index == 2){
     Get.toNamed(Routes.WRITING);
    }else{
      currentIndex(index);
    }
  }
}
