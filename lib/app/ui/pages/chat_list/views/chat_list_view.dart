// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/components/framework.dart';
// import 'package:get/get.dart';
// import 'package:travelidge/ui/login/controller/auth_controller.dart';
// import 'package:travelidge/ui/chat_list/controllers/chat_list_controller.dart';
// import 'package:travelidge/ui/declare/page/declare_page.dart';
//
// class declare extends GetView<ChatListController> {
//   final authC = Get.find<AuthController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             children: [
//               //추천 유저
//               Expanded(
//                 child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                   stream: controller.userList(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.active) {
//                       var chatDocsList = snapshot.data!.docs;
//
//                       return ListView.builder(
//                         itemCount: chatDocsList.length,
//                         itemBuilder: (context, index) {
//                           if(authC.user.value.email != chatDocsList[index]["email"]){
//                             return ListTile(
//                                 title: Text(chatDocsList[index]["email"]),
//                                 onTap: () {
//                                   controller.newChatRoom(authC.user.value.email,
//                                       chatDocsList[index]["email"]);
//                                 });
//                           }
//                           return Container();
//                         },
//                       );
//                     }
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   },
//                 ),
//               ),
//               //친구 목록
//               Expanded(
//                   child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                 stream: controller.chatList(authC.user.value.email),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.active) {
//                     var chatList = snapshot.data!.docs;
//
//                     return ListView.builder(
//                       itemCount: chatList.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                             title: Text(chatList[index]["toId"]),
//                             onTap: () {
//                               Get.to(() => declare1(),
//                                   arguments: chatList[index]["chatRoom"]);
//                             });
//                       },
//                     );
//                   }
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 },
//               ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
