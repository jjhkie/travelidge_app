import 'package:get/get.dart';

class DeclareController extends GetxService{

  RxInt index = 0.obs;
  void changeDropDown(int? itemIndex){
    index(itemIndex);
  }

}