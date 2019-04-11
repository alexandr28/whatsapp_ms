import 'package:flutter/material.dart';
import 'package:whatsapp_ms/views/placeholder.dart';
import 'package:whatsapp_ms/views/chat_list_widget.dart';
import 'package:whatsapp_ms/views/camera_screen.dart';

class Whatsapp extends StatefulWidget {

  var cameras;
  Whatsapp(this.cameras);
  @override
  _WhatsappState createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController=TabController(length: 4,initialIndex: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        //backgroundColor: Theme.of(context).accentColor,
        title: Text("Whatsapp"),
        elevation: 0.7,
        bottom: TabBar(
            controller: _tabController,
            //indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt),),
              Tab(
                child: Text("CHATS", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),),
              Tab(child: Text("ESTADOS",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),),
              Tab(child: Text("LLAMADAS",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),),
            ]
        ),
        actions: <Widget>[
          Icon(Icons.search),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0),),
          Icon(Icons.more_vert)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 65, 202, 68),//Theme.of(context).accentColor,
        onPressed: null,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            CameraScreen(widget.cameras),
            ChatListWidget(),
            PlaceHolderWidget(),
            PlaceHolderWidget()
          ]
      ),
    );
  }
}
