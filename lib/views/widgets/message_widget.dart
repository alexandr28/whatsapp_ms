import 'package:flutter/material.dart';
import 'package:whatsapp_ms/models/chat_item.dart';
import 'package:whatsapp_ms/views/widgets/check_widget.dart';
import 'package:whatsapp_ms/models/chat_detail_item.dart';
class MessageWidget extends StatelessWidget {
  final ChatDetailItem chatDetailItem;
  final bool isSameuser;
  MessageWidget({this.chatDetailItem,this.isSameuser});
  @override
  Widget build(BuildContext context) {
    CheckStatus checkStatus= chatDetailItem.readMessage? CheckStatus.doublecheckblue:CheckStatus.uncheck;
    bool isMine= chatDetailItem.isMine;
    return Padding(
      padding: EdgeInsets.only(right: isMine? 0.0 : 110.0, left: isMine? 110.0 : 0.0),
      child: Card(
        color: isMine? Colors.green[100]:Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(chatDetailItem.phoneNumber),
                    Text("~${chatDetailItem.name}"),
                  ],
                ),
                Text(chatDetailItem.message),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(chatDetailItem.lastMessageTime,
                      style: TextStyle(color: Colors.grey),
                    ),
                    //isMine?Container():CheckWidget(checkStatus: checkStatus),
                    CheckWidget(checkStatus: checkStatus),
                  ],
                ),

              ],
            ),
        ),
      ),
    );
  }
}
