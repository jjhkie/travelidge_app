import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/chat/controller/chat_controller.dart';
import 'package:travelidge/app/ui/theme/app_colors.dart';

class Chat extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.lightGrey,
        body: Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // StreamBuilder<RecordingDisposition>(
                  //   stream: controller.recorder.value.onProgress,
                  //   builder: (context, snapshot) {
                  //     if (!snapshot.hasData) {
                  //       print('없어');
                  //     }
                  //     if (snapshot.hasData) {
                  //       print('있어');
                  //     }
                  //     final duration = snapshot.hasData
                  //         ? snapshot.data!.duration
                  //         : Duration.zero;
                  //     String twoDigits(int n) => n.toString().padLeft(1);
                  //     final twoDigitMinutes =
                  //         twoDigits(duration.inMinutes.remainder(60));
                  //     final twoDigitSeconds =
                  //         twoDigits(duration.inSeconds.remainder(60));
                  //
                  //     return Text('${twoDigitMinutes}:${twoDigitSeconds}',
                  //         style: TextStyle(
                  //             fontSize: 80, fontWeight: FontWeight.bold));
                  //   },
                  // ),
                  Obx(() => Row(
                    children: [
                      ElevatedButton(
                        child: Icon(
                          controller.recorderPlay.value ? Icons.stop : Icons.mic,
                          size: 80,
                        ),
                        onPressed: () => controller.getRecorder(),
                      ),
                      Text(controller.recorderPlay.value
                          ? '녹음 중입니다.'
                          : '버튼을 누르시면 녹음합니다.'),
                    ],
                  )),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () => controller.getPlayback(),
                          child: Icon(
                              controller.audioPlay.value
                                  ? Icons.stop
                                  : Icons.arrow_back_ios,
                              size: 80)),
                      Text(controller.audioPlay.value
                          ? '재생 중입니다.'
                          : '버튼을 누르시면 재생합니다.')
                    ],
                  )
                ],
              )),
        );
  }
}
