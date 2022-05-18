

class Notice {
  int? noticeNo;
  String? title;
  String? contents;

  Notice({this.noticeNo, this.title, this.contents});

  //json String 을 object로 변환해줌
  Notice.fromJson(Map<String, dynamic> json) {
    noticeNo = json['noticeNo'];
    title = json['title'];
    contents = json['contents'];
  }

  //object 를 json string으로 변환해줌
  //map 형식으로 변환, jsonEncode에서 string으로 만들어준다.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noticeNo'] = this.noticeNo;
    data['title'] = this.title;
    data['contents'] = this.contents;
    return data;
  }
}