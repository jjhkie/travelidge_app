
import 'package:travelidge/data/provider/api.dart';

class HomeRepository{

  final  ApiClient apiClient;

  HomeRepository(this.apiClient);

  getHomeData(){
    return apiClient.getHomeData();
  }
}