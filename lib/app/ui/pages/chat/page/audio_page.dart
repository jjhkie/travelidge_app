import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:intl/intl.dart' show DateFormat;


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FlutterSoundRecorder _recordingSession;
  final recordingPlayer = AssetsAudioPlayer();
  late String pathToAudio;
  bool _playAudio = false;
  String _timerText = '00:00:00';
  @override
  void initState() {
    super.initState();
    initializer();
  }
  void initializer() async {
    pathToAudio = '/sdcard/Download/temp.wav';
    _recordingSession = FlutterSoundRecorder();
    await _recordingSession.openRecorder();
    await _recordingSession.setSubscriptionDuration(Duration(milliseconds: 10));
    await initializeDateFormatting();
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: Text('Audio Recording and Playing')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              child: Center(
                child: Text(
                  _timerText,
                  style: TextStyle(fontSize: 70, color: Colors.red),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: startRecording, icon: Icon(Icons.mic)),
                SizedBox(
                  width: 30,
                ),
                IconButton(onPressed: stopRecording, icon: Icon(Icons.stop)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style:
              ElevatedButton.styleFrom(elevation: 9.0, primary: Colors.red),
              onPressed: () {
                setState(() {
                  _playAudio = !_playAudio;
                });
                if (_playAudio) playFunc();
                if (!_playAudio) stopPlayFunc();
              },
              icon: _playAudio
                  ? Icon(
                Icons.stop,
              )
                  : Icon(Icons.play_arrow),
              label: _playAudio
                  ? Text(
                "Stop",
                style: TextStyle(
                  fontSize: 28,
                ),
              )
                  : Text(
                "Play",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> startRecording() async {
    Directory directory = Directory(pathToAudio);
    if (!directory.existsSync()) {
      directory.createSync();
    }
    _recordingSession.openRecorder();
    await _recordingSession.startRecorder(
      toFile: pathToAudio,
      codec: Codec.pcm16WAV,
    );
    StreamSubscription _recorderSubscription =
    _recordingSession.onProgress!.listen((e) {
      var date = DateTime.fromMillisecondsSinceEpoch(e.duration.inMilliseconds,
          isUtc: true);
      var timeText = DateFormat('mm:ss:SS', 'en_GB').format(date);
      setState(() {
        _timerText = timeText.substring(0, 8);
      });
    });
    _recorderSubscription.cancel();
  }
  Future<String?> stopRecording() async {
    _recordingSession.closeRecorder();
    final audioFile = await _recordingSession.stopRecorder();
    File(audioFile!);
    return audioFile;
  }
  Future<void> playFunc() async {
    recordingPlayer.open(
      Audio.file(pathToAudio),
      autoStart: true,
      showNotification: true,
    );
  }
  Future<void> stopPlayFunc() async {
    recordingPlayer.stop();
  }
}