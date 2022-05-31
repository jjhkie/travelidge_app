import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeclareController extends GetxService{


  FirebaseFirestore store = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  late TextEditingController chatC;
  late FocusNode focusNode;
  late ScrollController scrollC;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamChatData(email, chatRoomN) {
    CollectionReference chats = store.collection("chats");

    print("----chatRoomN---");
    print(chatRoomN);
    //return chats.doc(uid).collection("chat").orderBy("time").snapshots();
    return chats.doc(chatRoomN).collection("messages").orderBy("time").snapshots();
  }

  void newChat(String uid,String chat,chatRoom) async{
    if(chat != ""){
      CollectionReference chats = store.collection('chats');
      String date = DateTime.now().toIso8601String();
      await chats.doc(chatRoom).collection('messages').add({
        "text":chat,
        "time":date,
        "fromId":uid
      });
      chatC.clear();
    }
  }
  @override
  void onInit() {
    chatC = TextEditingController();
    scrollC = ScrollController();
    focusNode = FocusNode();
    super.onInit();
  }
  @override
  void onClose() {
    chatC.dispose();
    scrollC.dispose();
    focusNode.dispose();
    super.onClose();
  }

}