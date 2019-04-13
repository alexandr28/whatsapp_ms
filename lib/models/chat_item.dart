import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_ms/models/user.dart';
class ChatItem{
  final String avatarUrl;
  final String name;
  final String message;
  final DateTime dateTime;
  final int unreadMessage;
  final CheckStatus checked;
  final User owner;
  ChatItem({
    this.avatarUrl,
    this.name,
    this.message,
    this.dateTime,
    this.unreadMessage=0,
    this.owner,
    this.checked=CheckStatus.uncheck
  });

  String get lastMessageTime => "${dateTime.hour}:${dateTime.minute}";
  String get shortMessage=> message.length>30?"${message.substring(0,30)}...":message;
  int get unreadMessageCount => unreadMessage>99?99:unreadMessage;
  bool get haveUnreadMessage=> unreadMessage!=0;

  factory ChatItem.fromJson(Map<String, dynamic> json){
    int seconds=0;
    if(json["dateTime"]!=null){
      seconds=json["dateTime"].seconds;
    }
    return ChatItem(
      message: json["message"]??"",
      dateTime: DateTime.fromMicrosecondsSinceEpoch(json["dateTime"].seconds),
      name: json["name"]??"",
      avatarUrl: json["avatarUrl"]??"",
    );
  }
}

enum CheckStatus{
  uncheck,
  check,
  doublecheck,
  doublecheckblue,
}