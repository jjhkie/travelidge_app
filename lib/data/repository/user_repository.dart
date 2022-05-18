

import 'package:travelidge/data/provider/api.dart';

class UserRepository{

  final ApiClient apiClient;

  UserRepository(this.apiClient);

  getScrollAll(nextNo){
    return apiClient.getScrollAll(nextNo);
  }


}