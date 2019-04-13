import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_ms/models/chat_item.dart';
import 'package:whatsapp_ms/views/widgets/message_widget.dart';
import 'package:whatsapp_ms/models/user.dart';
import 'package:whatsapp_ms/models/chat_detail_item.dart';

class ChatUserWidget extends StatelessWidget {
  List<ChatItem> chatItems;
  final User user;
  ChatUserWidget({this.chatItems,this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.videocam),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.call),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        title: Text("usuario1"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: tempChatDetailItem.length,
              itemBuilder: (context,position){
                return MessageWidget(
                  chatItem:tempChatDetailItem[position],
                  isMine: tempChatDetailItem[position].isMine,
                );
              },
            ),
            TextField(),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
      /* Column(
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
      ),*/
    );
  }
}

List<ChatDetailItem> tempChatDetailItem =[
  ChatDetailItem(
    name: "Adriana",
    message: "como estas vienes a casa",
    dateTime: DateTime.parse("2019-04-12 10:40"),
    isMine: false,
    readMessage: true,
    phoneNumber: "+51 962 384 275",
    avatarUrl: "https://fotos00.laopiniondemalaga.es/2012/03/20/318x200/2012-03-20_IMG_2012-03-20_19:25:43_limaefe.jpg"
  ),
  ChatDetailItem(
      name: "Mila Cunis",
      message: "viajando a europa",
      dateTime: DateTime.parse("2019-04-02 12:40"),
      isMine: true,
      phoneNumber: "+51 962 384 275",
      avatarUrl: "https://www.guiadelocio.com/var/guiadelocio.com/storage/images/cine/personajes/mila-kunis/6167200-22-esl-ES/mila-kunis.jpg"
  ),
];
