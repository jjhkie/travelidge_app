// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:travelidge/data/model/user_model.dart';
// import 'package:travelidge/ui/nav/screen/nav_bottom.dart';
// import 'package:travelidge/ui/sign/screen/login_main_page.dart';
//
// class AuthController extends GetxService {
//   late Rx<User?> _user;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseFirestore store = FirebaseFirestore.instance;
//
//   var user = UsersModel().obs;
//
//   @override
//   void onReady() {
//     super.onReady();
//     FirebaseAuth.instance.signOut();
//     _user = Rx<User?>(auth.currentUser);
//     _user.bindStream(auth.userChanges());
//     if (user.value.email == null) {
//       Get.offAll(() => LoginPage());
//     } else {
//       Get.offAll(() => page());
//     }
//   }
//
//   void login(String email, password) async {
//     try {
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//
//       CollectionReference users = store.collection('users');
//       final currUser = await users.doc(auth.currentUser!.email).get();
//       final currUserData = currUser.data() as Map<String, dynamic>;
//
//       user(UsersModel.fromJson(currUserData));
//
//       user.refresh();
//
//       // await users.doc(auth.currentUser!.email).collection("chats").doc().set({
//       //   "uid": auth.currentUser!.uid,
//       //   "email": auth.currentUser!.email,
//       //   "updatedTime": DateTime.now().toIso8601String(),
//       // });
//       final listChats = await users.doc(auth.currentUser!.email).collection("chats").get;
//       Get.offAll(() => page());
//     } catch (e) {
//       Get.snackbar("About login", "login message",
//           backgroundColor: Colors.redAccent,
//           snackPosition: SnackPosition.BOTTOM,
//           titleText: Text(
//             "login failed",
//             style: TextStyle(color: Colors.white),
//           ),
//           messageText: Text(
//             e.toString(),
//             style: TextStyle(color: Colors.white),
//           ));
//     }
//   }
//
//   void register(String email, password) async {
//     try {
//
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       print('회원가입에 성공했습니다.');
//       CollectionReference users = store.collection('users');
//       await users.doc(auth.currentUser!.email).set({
//         "uid": auth.currentUser!.uid,
//         "email": auth.currentUser!.email,
//         "updatedTime": DateTime.now().toIso8601String(),
//       });
//
//       print('스낵바 성공했습니다.');
//       Get.back();
//     } catch (e) {
//       Get.snackbar("About User", "user message",
//           backgroundColor: Colors.redAccent,
//           snackPosition: SnackPosition.BOTTOM,
//           titleText: Text(
//             "$email $password",
//             style: TextStyle(color: Colors.white),
//           ),
//           messageText: Text(
//             e.toString(),
//             style: TextStyle(color: Colors.white),
//           ));
//     }
//   }
// }
