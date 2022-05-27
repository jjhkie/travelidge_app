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

  Stream<QuerySnapshot<Map<String, dynamic>>> streamChatData(String uid) {
    CollectionReference chats = store.collection("chats");
    //return chats.doc(uid).collection("chat").orderBy("time").snapshots();
    return chats.doc("aaa").collection("chat").orderBy("time").snapshots();
  }

  void newChat(String uid,String chat) async{

    if(chat != ""){
      CollectionReference chats = store.collection('chats');

      String date = DateTime.now().toIso8601String();
      await chats.doc("aaa").collection('chat').add({
        "text":chat,
        "time":date,
        "userId":uid
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