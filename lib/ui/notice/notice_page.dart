import 'package:flutter/material.dart';
import 'package:travelidge/controller/notice_controller.dart';
import 'package:travelidge/repository/notice_repository.dart';

import '../../model/notice.dart';

class notice extends StatefulWidget {
  @override
  State<notice> createState() => _noticeState();
}

class _noticeState extends State<notice> {
  var noticeController = NoticeController(NoticeRepository());

  final TextController = TextEditingController();

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    TextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notice Data')),
      body: FutureBuilder<dynamic>(
        future: noticeController.getData(),
        builder: (context, snapshot) {
          //data를 아직 받아 오지 못했을 때 실행되는 부분.
          //snapshot.hasData == false 인 경우이다.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); //로딩 애니메이션
          }


          //에러가 발생한 경우 반환되는 부분
          if (snapshot.hasError) {
            return Center(child: Text('error'));
          }

          return ListView.separated(
              itemBuilder: (context, index) {
                var notice = snapshot.data?[index];
                return Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text('${notice?.noticeNo}')),
                      Expanded(flex: 1, child: Text('${notice?.title}')),
                      Expanded(flex: 2, child: Text('${notice?.contents}')),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(child: buildCallContainer('patch')),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    noticeController.deleteNotice(notice!);
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Item Deleted"),
                                  ));
                                },
                                child: buildCallContainer('delete')),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 0.5, height: 0.5);
              },
              itemCount: snapshot.data?.length ?? 0);
        },
      ),
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('글 작성'),
                content: Column(
                  children: <Widget>[
                    TextField(
                      controller: titleController
                    ),
                    TextField(
                      controller: contentController
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('확인'),
                    onPressed: () {
                      Map data = {
                        "noticeNo": 0,
                        "title" : "${titleController.text}",
                        "contents" : "${contentController.text}"
                      };
                      print('-----------------------textbutton');
                      print('-----------------------${titleController.text}');
                      print('-----------------------${contentController.text}');

                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('취소'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            }
          ),
          backgroundColor: Colors.black,
          child: Icon(Icons.add)),
    );
  }

  //button 생성
  Container buildCallContainer(String title) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(child: Text('$title')),
    );
  }
  void searchKeyword(String query){

  }
}

