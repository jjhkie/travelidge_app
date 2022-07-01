import 'package:get/get.dart';
import 'package:travelidge/ui/write/components/destination_bottom_sheet.dart';

class WriteController extends GetxController{
  final location = [
    '서울',
    '경기도',
    '강원도',
    '충청남도',
    '충청북도',
    '부산',
    '대구',
    '인천',
    '광주',
    '대전',
    '울산',
    '강원도',
    '전라남도',
    '전라북도',
    '경상북도',
    '경상남도',
    '제주도'
  ];

  RxString bottomSheetDe = '목적지'.obs;
  RxBool leadTimeDay = true.obs;
  RxBool timeDayConference = false.obs;

  RxInt maxPeople = 1.obs;

  RxBool priceChoice = true.obs;
  RxBool priceConference = false.obs;

  destinationClick(index){
    bottomSheetDe.value = location[index];
    Get.back();
  }

  destinationToggle(){
    Get.bottomSheet(DestinationBottomSheet());
  }

  leadTimeToggle(String TD){
    if(TD =='time' && leadTimeDay.value == false){
      leadTimeDay.value = !leadTimeDay.value;
    }else if(TD =='day' && leadTimeDay.value == true){
      leadTimeDay.value = !leadTimeDay.value;
    }
  }

  timeDayConferenceToggle(){
     timeDayConference.value = !timeDayConference.value;
  }

  peopleAdd(){
    maxPeople++;
  }

  peopleremove(){
    if(maxPeople>1){
      maxPeople--;
    }
  }

  priceConferenceToggle(){
    priceConference.value = !priceConference.value;
  }

  priceToggle(String Pr){
    if(Pr =='free'&&priceChoice==false){
      priceChoice.value = !priceChoice.value;
      priceConference.value = false;
    }else if(Pr =='pay'&& priceChoice==true){
      priceChoice.value = !priceChoice.value;
    }
  }

}