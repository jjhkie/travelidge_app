
import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.uid,
    this.email,
    this.updatedTime,
    this.chats,
  });

  String? uid;
  String? email;
  String? updatedTime;
  List<ChatUser>? chats;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    uid: json["uid"],
    email: json["email"],
    updatedTime: json["updatedTime"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "email": email,
    "updatedTime": updatedTime,
  };
}

class ChatUser {
  ChatUser({
    this.connection,
    this.chatId,
    this.lastTime,
    this.total_unread,
  });

  String? connection;
  String? chatId;
  String? lastTime;
  int? total_unread;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
    connection: json["connection"],
    chatId: json["chat_id"],
    lastTime: json["lastTime"],
    total_unread: json["total_unread"],
  );

  Map<String, dynamic> toJson() => {
    "connection": connection,
    "chat_id": chatId,
    "lastTime": lastTime,
    "total_unread": total_unread,
  };
}
