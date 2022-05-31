import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/ui/notice/controller/notice_controller.dart';
import 'package:travelidge/ui/notice/widgets/notice_widget.dart';

class notice extends GetView<NoticeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notice Data')),
      body: Obx(
        () => ListView.separated(
            controller: controller.getNoticeAll(),
            itemBuilder: (_, index) {
              var data = controller.noticeList[index];

              return Container(
                height: 100.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text('${data.noticeNo}')),
                    Expanded(flex: 1, child: Text('${data.title}')),
                    Expanded(flex: 2, child: Text('${data.contents}')),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(child: buildCallContainer('patch')),
                          InkWell(
                              onTap: () {
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
            itemCount: controller.noticeList.length),
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
                      TextField(),
                      TextField(),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('확인'),
                      onPressed: () {
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
              }),
          backgroundColor: Colors.black,
          child: Icon(Icons.add)),
    );
  }



}
