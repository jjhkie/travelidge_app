


import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatController extends GetxController{

  var recorder = FlutterSoundRecorder().obs;
  RxBool ing = false.obs;
  bool isRecorderReady = false;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initRecorder();
  }

  Future initRecorder() async{
    final status = await Permission.microphone.request();

    if(status != PermissionStatus.granted){
      throw 'Microphone permission not granted';
    }

    await recorder.value.openRecorder();
    isRecorderReady = true;
  }

  @override
  void dispose() {
    super.dispose();
    recorder.value.closeRecorder();
  }

  buttonClick() async{
    if (recorder.value.isRecording){
      await stop();
      ing.value = false;
    } else {
      await record();
      recorder.value.setSubscriptionDuration(Duration(milliseconds:100));
      ing.value = true;
    }
  }

  Future record() async{
    await recorder.value.startRecorder(toFile: 'audioFileTest');
  }

  Future stop() async {
    final path =await recorder.value.stopRecorder();

    final audioFile = File(path!);

    print('recorded audio : $audioFile');
  }

}