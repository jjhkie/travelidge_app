


import 'package:get/get.dart';
import 'package:travelidge/app/data/model/detail_model.dart';
import 'package:travelidge/app/data/repository/detail_repository.dart';
import 'package:intl/intl.dart';
class DetailController extends GetxController{
  static DetailController get to => Get.find<DetailController>();
  DetailController(this._repository);

  final DetailRepository _repository;
  //RxMap board = <String,dynamic>{}.obs;
  var board = BoardContents().obs;
  final review = <ReviewList>[].obs;
  final member = <TravelMemberList>[].obs;
  var acceptMember =<TravelMemberList>[].obs;
  var rejectMember =<TravelMemberList>[].obs;
  var notAcceptMember = <TravelMemberList>[].obs;//본인 게시물일 경우 보여질 신청자 목록
  @override
  void onInit() {
    super.onInit();

  }

  checkAcceptMember(){
    /**
     * Todo [] : 사용자가 작성자일 경우
     * */
    acceptMember = member.where((item) => item.acceptYn == 'Y').toList().obs;
    rejectMember = member.where((item) => item.acceptYn == 'N').toList().obs;
    notAcceptMember = member.where((item) => item.acceptYn == "").toList().obs;
    print('accept ----- ${acceptMember}');
    print('notAcceptMember ----- ${notAcceptMember}');

  }

  /** 날짜 형식 변경 */
  String? stringDate(String? date){
    print(date);
    if(date != null) {
      DateFormat date1Format = DateFormat('yyyy-MM-dd');
      DateFormat date2Format = DateFormat('MM/dd');
      return date2Format.format(date1Format.parse(date));
    }else {
      return null;
    }
  }

  /** 가격 형식 변경*/
  String? stringPrice(int? price){
    if(board.value.isCost == true){
      var numberF = NumberFormat('###,###,###,###원');
      return numberF.format(price);
    }else{
      return null;
    }
  }


  /** API  정보 가져오기 */
  getData(int docNo){
    print('---a : $docNo');
    _repository.getBoardData(docNo).then((data){
      board.value = data.boardContents;
      review.value = data.reviewList;
      member.value = data.travelMemberList;
      //member 승인 내역
      checkAcceptMember();
      print('review : ${review.value}');
    });
  }
}