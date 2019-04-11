import 'package:flutter/material.dart';
import 'package:whatsapp_ms/models/chat_item.dart';
import 'package:whatsapp_ms/views/widgets/check_widget.dart';

class ChatItemWidget extends StatelessWidget {
  final ChatItem chatItem;
  final VoidCallback onTap;
  ChatItemWidget({@required this.chatItem, this.onTap}): assert(chatItem!=null);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chatItem.avatarUrl),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(chatItem.name, style: TextStyle(fontWeight: FontWeight.bold),),
          Text(chatItem.lastMessageTime, style: TextStyle(color: chatItem.haveUnreadMessage?Colors.green:Colors.grey, fontSize: 10.0),),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CheckWidget(checkStatus: chatItem.checked),
              Text(chatItem.shortMessage),
            ],
          ),
          chatItem.haveUnreadMessage?Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle, color: Color.fromARGB(255, 65, 202, 68),
            ),
            child: Text("${chatItem.unreadMessage}", style: TextStyle(color: Colors.white,fontSize: 10.0),),
          )
              :Container()
        ],
      ),
    );
  }
}
