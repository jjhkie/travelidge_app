import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/ui/nav/nav_bottom.dart';
import 'package:travelidge/ui/sign/screen/login_main_page.dart';

class AuthController extends GetxService {
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?>(auth.currentUser);
    print('회원 정보');
    print(_user.value!.email);
    _user.bindStream(auth.userChanges());
    if (_user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => page());
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      Get.offAll(() => page());
    } catch (e) {
      Get.snackbar("About login", "login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void register(String email, password) async {
    try {

      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('회원가입에 성공했습니다.');
      print('스낵바 성공했습니다.');
      Get.back();
    } catch (e) {
      Get.snackbar("About User", "user message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "$email $password",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }
}
