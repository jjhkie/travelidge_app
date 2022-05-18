

import 'package:travelidge/data/provider/api.dart';

class UserRepository{

  final ApiClient apiClient;

  UserRepository(this.apiClient);

  getScrollAll(countPerPage){
    return apiClient.getScrollAll(countPerPage);
  }


  getPageInfo(){
    return apiClient.getPageInfo();
  }
}