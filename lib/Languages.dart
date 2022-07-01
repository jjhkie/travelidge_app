import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': {

          //Home
          'logo': 'Logo',
          'appBarTitle': '언제 어디로 떠나세요?',
          'locationBs': '어디로 떠나세요',
          'calendarBs': '얼마나 여행하세요',

          //목적지


          //Home - AppBar
          'ContentFun_1':'현지인 상품',
          'ContentFun_2':'같이가요',
          'ContentFun_3':'현지인 요청',
          'SummaryFun_1':'상품',
          'SummaryFun_2':'같이',
          'SummaryFun_3':'요청',

          'ContentGen':'전체',
          'ContentGen_1':'액티비티',
          'ContentGen_2':'박물관/전시회',
          'ContentGen_3':'이색체험',
          'ContentGen_4':'맛집',
          'ContentGen_5':'관광',
          'ContentGen_6':'자연/휴식',
          //writing
          'category_t':'카테고리',
          'category_content':'하나만 고를 수 있어요',
          'title_t':'제목',
          'destination_t':'목적지',
          'lead_t':'상품 소요시간',
          'lead_time':'시간',
          'lead_day':'1박 이상',
          //Common
          'CheckOn': '확인',
          'Cancel': '나중에 하기'
        },
        'en_US': {
          'first': 'Hello',
        }
      };
}
