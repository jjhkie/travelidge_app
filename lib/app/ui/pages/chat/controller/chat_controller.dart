


import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class ChatController extends GetxController{

  Rx<FlutterSoundPlayer?> player = FlutterSoundPlayer().obs;


  bool isPlayerInited = false;
  bool isRecorderInited = false;
  bool isPlaybackReady = false;

  var recorderPlay = false.obs;
  var audioPlay = false.obs;

  var recorder = FlutterSoundRecorder().obs;



  final String path = 'voice_recorder.aac';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    player.value!.openPlayer().then(((value) {
      isPlayerInited = true;
    }));

    openTheRecord();
  }

  @override
  void dispose() {
    super.dispose();

    player.value!.closePlayer();
    player.value = null;
    recorder.value.closeRecorder();
    //recorder.value = null;
  }

  openTheRecord() async{
    var status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      throw RecordingPermissionException('Permission not granted');
    }

    await recorder.value.openRecorder();
    isRecorderInited = true;
  }

  void record(){
    recorder.value.startRecorder(toFile: path);
    print('record');
    recorderPlay.value = true;
  }

  void stopRecord() async{
    await recorder.value.stopRecorder().then(((value){
      isPlaybackReady = true;
      print('record stop');

      final audioFile = File(value!);
      //filepath = audioFile.toString();
      print('recorded audio : $audioFile');
      recorderPlay.value = false;
    }));
  }

  void play(){
    assert(isPlayerInited && isPlaybackReady && recorder.value.isStopped && player.value!.isStopped);
    print('aaaaaa');
    player.value!.startPlayer(fromURI: path, whenFinished: () => (){});
    print('bbbbb');
    audioPlay.value = true;
  }

  void stopPlayer(){
    player.value!.stopPlayer().then(((vaule){
      audioPlay.value = false;
    }));
  }

  void getRecorder() {
    print(recorder.value.isRecording);
    if (!isRecorderInited || !player.value!.isStopped){
      print('return');
      return;
    }
    recorder.value.isStopped ? record(): stopRecord();
    update();
  }

  void getPlayback(){
    if(!isPlayerInited || !isPlaybackReady || !recorder.value.isStopped){
      print('return');
      return;
    }
    player.value!.isStopped ? play() : stopPlayer();
  }

  /**
  late FlutterSoundRecorder recordingSession;
  //var recorder = FlutterSoundRecorder().obs;
  var audioPlayer = AssetsAudioPlayer();
    String? filepath; // 녹음된 파일이 저장되는 경로
    RxBool ing = false.obs; //녹음을 하고 있는 상태인지 확인 false 경우 오디오 실행 가능
    bool isRecorderReady = false;


    void initializer() async {
      filepath = '/sdcard/Download/temp.wav';
      recordingSession = FlutterSoundRecorder();

      await recordingSession.openRecorder();
      await recordingSession.setSubscriptionDuration(Duration(
          milliseconds: 10));
      //await initializeDateFormatting();
      await Permission.microphone.request();
      await Permission.storage.request();
      await Permission.manageExternalStorage.request();
    }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializer();
    //initRecorder();
  }

  // Future initRecorder() async{
  //   final status = await Permission.microphone.request();
  //
  //   if(status != PermissionStatus.granted){
  //     throw 'Microphone permission not granted';
  //   }
  //
  //   await recorder.value.openRecorder();
  //   isRecorderReady = true;
  // }

  @override
  void dispose() {
    super.dispose();
    recordingSession.closeRecorder();
  }

  buttonClick() async{
    if (recordingSession.isRecording){
      await stop();
      ing.value = false;
    } else {
      await record();
      recordingSession.setSubscriptionDuration(Duration(milliseconds:100));
      ing.value = true;
    }
  }

  Future record() async{
    Directory tempDir = Directory(filepath!);
    if (!tempDir.existsSync()) {
      tempDir.createSync();
    }
    //String outputFile = '${tempDir.path}/myFile.mp4';
    await recordingSession.startRecorder(
      toFile: filepath,
      codec: Codec.pcm16WAV,);


  }

  Future stop() async {
      recordingSession.closeRecorder();
    final path =await recordingSession.stopRecorder();

    // final audioFile = File(path!);
    // filepath = audioFile.toString();
    // print('recorded audio : $audioFile');
    print('filepath  : $filepath');
  }

  Future<void> playFunc() async {
    audioPlayer.open(
      Audio.file(filepath!),
      autoStart: true,
      showNotification: true,
    );
    print('aaa');
  }
   */
}