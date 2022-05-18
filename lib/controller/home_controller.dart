

import 'package:get/get.dart';
import 'package:travelidge/data/repository/home_repository.dart';

class HomeController extends GetxController{
  final HomeRepository _repository;

  HomeController(this._repository);



   getData() async {
     return _repository.getHomeData();
  }

}