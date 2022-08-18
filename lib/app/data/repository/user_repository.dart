


import 'package:travelidge/app/data/model/review_model.dart';
import 'package:travelidge/app/data/provider/api.dart';

class UserRepository{

  final ApiClient apiClient;

  UserRepository(this.apiClient);

  getScrollAll(nextNo){
    return apiClient.getScrollAll(nextNo);
  }

<<<<<<< Updated upstream
=======
  ///유저 번호를 이용하여 리뷰 정보 가져오기
  getUserReviewALL(userNo){
    return apiClient.getIndividualTotalReview(userNo);
  }

  ///유저 번호를 이용하여 리뷰 작성하기
  putUserReview(Review data){
    return apiClient.putIndividualReview(data);
  }

>>>>>>> Stashed changes

}