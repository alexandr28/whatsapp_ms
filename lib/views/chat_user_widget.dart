import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_ms/models/chat_item.dart';
import 'package:whatsapp_ms/views/widgets/message_widget.dart';
import 'package:whatsapp_ms/models/user.dart';

class ChatUserWidget extends StatelessWidget {
  List<ChatItem> chatItems;
  final User user;
  ChatUserWidget({this.chatItems,this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("usuario1"),),
      ),
      body: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: chatItems.length,
              itemBuilder: (context,position){
                return MessageWidget(chatItem:chatItems[position],isMine: user==chatItems,);
              },
          ),
          Row(
            children: <Widget>[
              TextField(),
              Icon(Icons.arrow_right),
            ],
          ),
        ],
      ),
    );
  }
}
