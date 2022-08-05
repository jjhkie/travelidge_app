// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:travelidge/data/model/travel_model.dart';
// import 'package:travelidge/data/repository/user_repository.dart';
// import 'package:travelidge/ui/sign/page/login_main_page.dart';
//
// class InfiniteScrollController extends GetxController {
//   final UserRepository _repository;
//
//   InfiniteScrollController(this._repository);
//
//   var scrollController = ScrollController().obs; //리스트뷰의 상태를 감지하기 위한
//   var travel = <MyTravel>[].obs;
//
//   RxInt nextNo = 0.obs;
//   var isLoading = false.obs; //로딩중 확인
//   var hasNext = false.obs; // 다음 데이터 존재 여부 확인
//
//   //컨트롤러가 생성될 떄 호출
//   @override
//   void onInit() {
//     _getData();
//     //변화가 감지되었을 때 position값을 이용해 보여진 정보의 가장 마지막 행에 도달했는지 확인
//     //마지막 행에 도달했을 경우 _getData()가 실행
//     scrollController.value.addListener(() {
//       if (scrollController.value.position.pixels >=
//               scrollController.value.position.maxScrollExtent*0.9 &&
//           hasNext.value&&!isLoading.value) {
//         print(nextNo);
//         _getData();
//       }
//     });
//     super.onInit();
//   }
//
//
//   _getData() async {
//     isLoading.value = true;
//     _repository.getScrollAll(nextNo).then((data) {
//       travel.addAll(data.myTravelList);
//       nextNo.value = data.pageInfo.nextNo;
//       hasNext.value = data.pageInfo.hasNext;
//       isLoading.value = false;
//     });
//   }
//
//   reload() async {
//     isLoading.value = true;
//     travel.clear();
//
//     _getData();
//     await Future.delayed(Duration(seconds: 2));
//
//   }
//
//   logout() async{
//     FirebaseAuth.instance.signOut();
//      Get.snackbar(
//       '로그아웃',
//       '로그아웃하였습니다',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//      Get.offAll(() => LoginPage());
//   }
//
// }
//
