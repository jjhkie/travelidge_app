import 'package:travelidge/model/home_model.dart';
import 'package:travelidge/repository/home_repository.dart';

class HomeController{
  final HomeRepository _repository;

  HomeController(this._repository);

  Future<HomeListModel> getData() async {
    return _repository.getData();
  }

}