import 'package:flutter/material.dart';
import 'package:whatsapp_ms/views/widgets/chat_item_widget.dart';
import 'package:whatsapp_ms/models/chat_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_ms/views/chat_user_widget.dart';

class ChatListWidget extends StatelessWidget {
  void goToChatUser(BuildContext context, Map<String, dynamic> data){
    List<ChatItem> chatItems= List<ChatItem>();
    chatItems.add(ChatItem.fromJson(data));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatUserWidget()));
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("messages").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("Error cargando mensajes");
        }
        switch(snapshot.connectionState){
          case  ConnectionState.waiting:
            return Center(child:CircularProgressIndicator(),);
            break;
          default:
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int position){
                  return Column(
                    children: <Widget>[
                      ChatItemWidget(
                        onTap: (){
                          goToChatUser(context,snapshot.data.documents[position].data);
                        },
                        chatItem:ChatItem.fromJson(snapshot.data.documents[position].data),
                      ),
                      Divider(height: 10.0,),
                    ],
                  );
              },
            );
            break;
        }
      },
    );
    /*
    return ListView.builder(
        itemCount: chatItems.length,
        itemBuilder: (BuildContext context, int position){
          return Column(
            children: <Widget>[
              ChatItemWidget(chatItem: chatItems[position]),
              Divider(height: 10.0,)
            ],
          );
        });*/
  }
}


List<ChatItem> chatItems=[
  ChatItem(
    avatarUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEoBgBoFjeIhNdAusnchYbkLru46fV0NzilfNJuvuHwuUkjurL",
    name: "Hally white",
    message: "comenzando nuevos proyectos viajamos a Lima a los eventos y convenciones que desarrollamos para tener mas alcance",
    dateTime: DateTime.parse("2019-27-03 11:16"),
    unreadMessage: 0,
    checked: CheckStatus.doublecheckblue,
  ),
  ChatItem(
    avatarUrl: "https://www.guiadelocio.com/var/guiadelocio.com/storage/images/cine/personajes/mila-kunis/6167200-22-esl-ES/mila-kunis.jpg",
    name: "Mila Cunis",
    message: "Viajando con Google convencion en montain view, nuevos enfoques para desarrollo de las apps para mobile",
    dateTime: DateTime.parse("2019-24-02 20:21"),
    unreadMessage: 12,
    checked: CheckStatus.doublecheck,
  ),
  ChatItem(
    avatarUrl: "https://fotos00.laopiniondemalaga.es/2012/03/20/318x200/2012-03-20_IMG_2012-03-20_19:25:43_limaefe.jpg",
    name: "Adriana Lima",
    message: "Model España edad 19 años viaja por el mundo cautivando a muchos diseñadores, trabaja en ayuda social tambien y es millonaria",
    dateTime: DateTime.parse("2019-24-02 20:21"),
    unreadMessage: 99,
    checked: CheckStatus.check,
  ),
];