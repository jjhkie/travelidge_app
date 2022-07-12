


import 'package:travelidge/app/data/provider/api.dart';

class UserRepository{

  final ApiClient apiClient;

  UserRepository(this.apiClient);

  getScrollAll(nextNo){
    return apiClient.getScrollAll(nextNo);
  }


}