import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_ms/models/chat_item.dart';
import 'package:whatsapp_ms/views/widgets/message_widget.dart';
import 'package:whatsapp_ms/models/user.dart';
import 'package:whatsapp_ms/models/chat_detail_item.dart';
import 'package:whatsapp_ms/views/widgets/input_text_widget.dart';

class ChatUserWidget extends StatefulWidget {
  List<ChatItem> chatItems;
  final User user;
  ChatUserWidget({this.chatItems,this.user});

  @override
  _ChatUserWidgetState createState() => _ChatUserWidgetState();
}

class _ChatUserWidgetState extends State<ChatUserWidget> {
  ScrollController scrollController= ScrollController();
  TextEditingController textEditingController=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mqd= MediaQuery.of(context);
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
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  height: mqd.size.height-145.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: tempChatDetailItem.length,
                    itemBuilder: (context,position){
                      return MessageWidget(
                        chatDetailItem:tempChatDetailItem[position],
                        isSameuser: position < 1 ? false: tempChatDetailItem[position - 1].name == tempChatDetailItem[position].name,
                      );
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: mqd.size.width - 60,
                      child: InputTextWidget(controller: textEditingController,),
                    ),
                    FloatingActionButton(
                      onPressed: (){
                        Firestore.instance.collection("messages").add({"message":textEditingController.text});
                      },
                      heroTag: "Play",
                      mini: true,
                      child: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 12.0,
              bottom: 50.0,
              child: FloatingActionButton(
                  onPressed: (){
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  backgroundColor: Color(0xffa9a9a9),
                foregroundColor: Colors.white,
                mini: true,
                child: Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


List<ChatDetailItem> tempChatDetailItem =[
  ChatDetailItem(
    name: "Adriana",
    message: "como estas vienes a casa",
    dateTime: DateTime.parse("2019-04-12 10:40:15"),
    isMine: false,
    //readMessage: false,
    phoneNumber: "+51 962 384 275",
    avatarUrl: "https://fotos00.laopiniondemalaga.es/2012/03/20/318x200/2012-03-20_IMG_2012-03-20_19:25:43_limaefe.jpg"
  ),
  ChatDetailItem(
      name: "Mila Cunis",
      message: "viajando a europa",
      dateTime: DateTime.parse("2019-04-02 12:40:25"),
      isMine: true,
      phoneNumber: "+51 962 384 275",
      readMessage: true,
      avatarUrl: "https://www.guiadelocio.com/var/guiadelocio.com/storage/images/cine/personajes/mila-kunis/6167200-22-esl-ES/mila-kunis.jpg"
  ),
];
