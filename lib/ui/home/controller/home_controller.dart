

import 'package:get/get.dart';
import 'package:travelidge/data/model/home_model.dart';
import 'package:travelidge/data/repository/home_repository.dart';

class HomeController extends GetxController{
  final HomeRepository _repository;
  var popular = <PopularLocal>[].obs;
  var friend = <Friend>[].obs;
  var recent = <RecentTravel>[].obs;
  var category = <Category>[].obs;
  HomeController(this._repository);



  //  getData() async {
  //    return _repository.getHomeData();
  // }

getData(){
  _repository.getHomeData().then((data){
    var home = data.home;

    this.popular.value = home.popularLocal;
    this.friend.value = home.friend;
    this.recent.value = home.recentTravel;
    this.category.value = home.category;

  });
}
}