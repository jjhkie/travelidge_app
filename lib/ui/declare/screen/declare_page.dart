import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelidge/ui/login/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:travelidge/ui/declare/controller/declare_controller.dart';
import 'package:travelidge/ui/declare/components/chat_bubble.dart';

class declare1 extends GetView<DeclareController> {
  final user = FirebaseAuth.instance.currentUser;
  final authC = Get.find<AuthController>();
  var chatRoom =Get.arguments;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [Expanded(child: chatScreen()), chatInput()],
        ),
      ),
    );
  }

  //채팅 화면
  Widget chatScreen() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.streamChatData('authC.user.value.email',chatRoom),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var chatDocs = snapshot.data!.docs;

            return ListView.builder(
              controller: controller.scrollC,
              itemCount: chatDocs.length,
              itemBuilder: (context, index) {
                if(chatDocs[index]["text"] == "생성"){
                  return Container();
                }else{
                  return ChatBubble(chatDocs[index]["text"],
                      chatDocs[index]["fromId"].toString() == user!.uid);
                }
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  //채팅 입력 위젯
  Widget chatInput() {
    return Container(
      margin: EdgeInsets.only(top: 7),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                controller: controller.chatC,
                focusNode: controller.focusNode,
                decoration: InputDecoration(
                  labelText: '메시지 보내기',
                ),
                onEditingComplete: () =>
                    controller.newChat(user!.uid,controller.chatC.text,chatRoom)),
          ),
          IconButton(
            onPressed: () {controller.newChat(user!.uid,controller.chatC.text,chatRoom);},
            icon: Icon(Icons.send),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
