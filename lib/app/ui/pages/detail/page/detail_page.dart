import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/detail/controller/detail_controller.dart';

class Detail extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.alarm,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom:100),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              /** 상단 image Page*/
              Container(
                  width: double.infinity,
                  height: 230,
                  child: Stack(
                    children: [
                      PageView.builder(
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          itemCount: 10,
                          onPageChanged: (value) {
                            print(value);
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              height: 300,
                              color: Colors.blue,
                              child: Text('test',
                                  style: TextStyle(color: Colors.white)),
                            );
                          }),
                      Positioned(
                          right: 20,
                          bottom: 16,
                          child: SizedBox(
                              width: 45,
                              height: 21,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black.withOpacity(0.6)),
                                child: Center(
                                    child: Text("1/30",
                                        style: TextStyle(color: Colors.white))),
                              )))
                    ],
                  )),
              /**  content Page*/
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color:Colors.grey
                            ),
                            child: Text('현지인 상품'),
                          ),
                          SizedBox(width:10),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:Colors.grey
                            ),
                            child: Text('액티비티'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text('이따 점심 같이 드실 분',
                          style: TextStyle(fontSize: 24)), //제목
                    ),
                    SizedBox(height: 20),
                    contentTextBox('목적지', '스페인 바르셀로나'),
                    contentTextBox('일정', '7/24'),
                    contentTextBox('소요시간', '3시간'),
                    contentTextBox('모집인원', '3명'),
                    contentTextBox('예상비용', '30,000원'),
                    SizedBox(height: 50),
                    Container(
                      child: Text(
                          '혼자 여행 왔는데 심심해서 구해봅니다.\n근처에 계신 분들 환영 ~\n식당은 같이 찾아봐요'),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Text('조회 5',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.withOpacity(0.7))),
                    ),
                    SizedBox(height: 20),
                    Container(height: 1, color: Colors.grey.withOpacity(0.5)),
                    SizedBox(height: 20),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(6),
                                  width:40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey
                                  ),
                                ),
                                Text('Name')
                              ],
                            ),
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline_sharp,
                      size: 30,
                    )),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(0.5))),
                    child: Text('문의하기', textAlign: TextAlign.center),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(0.5))),
                    child: Text('참여하기', textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget contentTextBox(title, content) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
              width: 70,
              child: Text('$title',
                  textAlign: TextAlign.start, style: TextStyle(fontSize: 16))),
          Flexible(
              fit: FlexFit.tight,
              child: Text('$content',
                  style: TextStyle(color: Colors.grey, fontSize: 16)))
        ],
      ),
    );
  }
}
