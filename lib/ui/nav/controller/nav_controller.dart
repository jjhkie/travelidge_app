import 'package:get/get.dart';

enum RoutName { home, community,writing,chat, user }

class NavController extends GetxService {// 동일한 인스턴스에 접근할 수 있다.
  static NavController get to => Get.find();

  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    currentIndex(index);
  }
}
