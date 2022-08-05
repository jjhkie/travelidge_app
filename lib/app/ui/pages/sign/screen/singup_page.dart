// import 'package:flutter/material.dart';
// import 'package:flutter/src/components/framework.dart';
// import 'package:get/get.dart';
// import 'package:travelidge/ui/login/controller/auth_controller.dart';
//
// class Signup extends GetView<AuthController> {
//   var emailC = TextEditingController();
//   var passwordC = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           iconTheme: IconThemeData(color: Colors.black),
//           backgroundColor: Colors.white,
//           title: Text('회원가입', style: TextStyle(color: Colors.black)),
//           elevation: 0),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             Container(
//               //이메일
//
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(30)),
//               child: TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 controller: emailC,
//                 decoration: InputDecoration(hintText: 'Email'),
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(30)),
//               child: TextField(
//                 obscureText: true,
//                 controller: passwordC,
//                 decoration: InputDecoration(hintText: 'Password'),
//               ),
//               //password
//             ),
//             SizedBox(height: 10),
//             Container(
//                 //가입 및 취소 버튼
//                 child: Row(
//               children: [
//                 ElevatedButton(onPressed: () {
//                   controller.register(emailC.text.trim(),passwordC.text.trim());
//                 }, child: Text('가입하기')),
//                 ElevatedButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     child: Text('닫기'))
//               ],
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
