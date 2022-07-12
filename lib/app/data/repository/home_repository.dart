


import 'package:travelidge/app/data/provider/api.dart';

class HomeRepository{

  final  ApiClient apiClient;

  HomeRepository(this.apiClient);

  getHomeData(){
    return apiClient.getHomeData();
  }
}