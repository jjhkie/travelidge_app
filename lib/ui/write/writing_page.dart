import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/controller/fcm_controller.dart';



class writing extends GetView<FcmController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: controller.initialize(), // 여기서 앱 실행 전에 해야 하는 초기화 진행
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(controller.message.value?.notification?.title ?? 'title', style: TextStyle(fontSize: 20)),
                       Text(controller.message.value?.notification?.body ?? 'message', style: TextStyle(fontSize: 15)),
                      //
                     TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),
                     ),Container(child: ElevatedButton(onPressed: (){}, child: Text('결과'),),)
                      
                    ],
                  )));
            } else if (snapshot.hasError) {
              return Center(child: Text('failed to initialize'));
            } else {
              return Center(child: Text('initializing...'));
            }
          },
        ),
      );
  }
}