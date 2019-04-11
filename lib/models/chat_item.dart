
class ChatItem{
  final String avatarUrl;
  final String name;
  final String message;
  final DateTime dateTime;
  final int unreadMessage;
  final CheckStatus checked;

  ChatItem({this.avatarUrl, this.name, this.message, this.dateTime,this.unreadMessage=0,this.checked=CheckStatus.uncheck});
  String get lastMessageTime => "${dateTime.hour}:${dateTime.minute}";
  String get shortMessage=> message.length>30?"${message.substring(0,30)}...":message;
  int get unreadMessageCount => unreadMessage>99?99:unreadMessage;
  bool get haveUnreadMessage=> unreadMessage!=0;
  factory ChatItem.fromJson(Map<String, dynamic> json){
    return ChatItem(
      message: json["message"],
      dateTime: DateTime.fromMicrosecondsSinceEpoch(json["dateTime"]),
      name: json["name"],
      avatarUrl: json["avatarUrl"],
    );
  }
}

enum CheckStatus{
  uncheck,
  check,
  doublecheck,
  doublecheckblue,
}