
import 'package:travelidge/app/data/provider/api.dart';

class DetailRepository{
  final  ApiClient apiClient;

  DetailRepository(this.apiClient);

  getBoardData(int docNo){
    return apiClient.getDetailData(docNo);
  }
}