import 'package:whatsapp_ms/models/user.dart';

class ChatDetailItem{
  final String avatarUrl;
  final String name;
  final String message;
  final DateTime dateTime;
  final bool readMessage;
  final bool isMine;
  final String phoneNumber;

  ChatDetailItem(
      this.avatarUrl,
      this.name,
      this.message,
      this.dateTime,
      this.readMessage,
      this.isMine,
      this.phoneNumber,
      );
  String get lastMessageTime => "${dateTime.hour}:${dateTime.minute}";
/*
  factory ChatDetailItem.fromJson(Map<String, dynamic> json){
    int seconds =0;
    if(json["datetime"]!=null){
      seconds=json["datetime"].seconds;
    }
    return ChatDetailItem(
      message: json["message"]?? "",
      dateTime: DateTime.fromMicrosecondsSinceEpoch(seconds),
      name: json["name"]??"",
      avatarUrl: json["avatarUrl"] ?? "",
    );
  }*/
}

