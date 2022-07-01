//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
//
// class ChatListController extends GetxService{
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   RxString chatRoomN = "".obs;
//
//   Stream<QuerySnapshot<Map<String, dynamic>>> userList() {
//     print(firestore.collection('users'));
//     return firestore.collection('users').snapshots();
//   }
//
//   Stream<QuerySnapshot<Map<String,dynamic>>> chatList(email){
//
//     return firestore.collection('users').doc(email).collection('chats').snapshots();
//   }
//
//   void newChatRoom(email, friendEmail) async{
//     String date = DateTime.now().toIso8601String();
//     CollectionReference users = firestore.collection('users');
//     CollectionReference chats = firestore.collection('chats');
//
//     final checkChat = await users.doc(email).collection('chats').doc(friendEmail).get();
//     if(checkChat.exists){
//     }else{
//       await users.doc(email).collection('chats').doc(friendEmail).set({
//         "chatRoom" : date,
//         "toId" : friendEmail
//       });
//       await users.doc(friendEmail).collection('chats').doc(email).set({
//         "chatRoom" : date,
//         "toId" : email
//       });
//
//       await chats.doc(date).collection('messages').doc('message').set({
//         "text" : "생성",
//         "time": date
//       });
//       chatRoomN = date as RxString;
//     }
//
//
//
//   }
//
//
// }