import 'package:get/get.dart';

enum RoutName { home, declare, notice, writing, user }

class NavController extends GetxService {
  static NavController get to => Get.find();

  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    currentIndex(index);
  }
}
