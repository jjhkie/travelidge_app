

import 'package:travelidge/app/data/provider/api.dart';

class NoticeRepository {

  final  ApiClient apiClient;


  NoticeRepository(this.apiClient);


  getNoticeAll(){
    return apiClient.getNoticeAll();
  }


}
