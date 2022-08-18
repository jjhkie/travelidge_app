
import 'dart:convert';

Review welcomeFromJson(String str) => Review.fromJson(json.decode(str));

String welcomeToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({
    this.reviewNo,
    this.createUserNo,
    this.createUserName,
    this.publicScope,
    this.title,
    this.contents,
    this.travelNo,
    this.createDate,
    this.heartCount,
    this.replyCount,
    this.location,
    this.imageThumbnailUrl,
    this.imageListUrl,
  });

  int? reviewNo;
  int? createUserNo;
  String? createUserName;
  int? publicScope;
  String? title;
  String? contents;
  int? travelNo;
  DateTime? createDate;
  int? heartCount;
  int? replyCount;
  String? location;
  String? imageThumbnailUrl;
  String? imageListUrl;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    reviewNo: json["reviewNo"] == null ? 0 : json["reviewNo"],
    createUserNo: json["createUserNo"] == null ? 0 : json["createUserNo"],
    createUserName: json["createUserName"] == null ? null : json["createUserName"],
    publicScope: json["publicScope"] == null ? 0 : json["publicScope"],
    title: json["title"] == null ? null : json["title"],
    contents: json["contents"] == null ? null : json["contents"],
    travelNo: json["travelNo"] == null ? 0 : json["travelNo"],
    createDate: json["createDate"] == null ? null : DateTime.parse(json["createDate"]),
    heartCount: json["heartCount"] == null ? 0 : json["heartCount"],
    replyCount: json["replyCount"] == null ? 0 : json["replyCount"],
    location: json["location"] == null ? null : json["location"],
    imageThumbnailUrl: json["imageThumbnailUrl"] == null ? null : json["imageThumbnailUrl"],
    imageListUrl: json["imageListUrl"] == null ? null : json["imageListUrl"],
  );

  Map<String, dynamic> toJson() => {
    "reviewNo": reviewNo == null ? null : reviewNo,
    "createUserNo": createUserNo == null ? null : createUserNo,
    "createUserName": createUserName == null ? null : createUserName,
    "publicScope": publicScope == null ? null : publicScope,
    "title": title == null ? null : title,
    "contents": contents == null ? null : contents,
    "travelNo": travelNo == null ? null : travelNo,
    "createDate": createDate == null ? null : createDate?.toIso8601String(),
    "heartCount": heartCount == null ? null : heartCount,
    "replyCount": replyCount == null ? null : replyCount,
    "location": location == null ? null : location,
    "imageThumbnailUrl": imageThumbnailUrl == null ? null : imageThumbnailUrl,
    "imageListUrl": imageListUrl == null ? null : imageListUrl,
  };
}
