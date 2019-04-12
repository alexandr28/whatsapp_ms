import 'package:flutter/material.dart';
import 'views/whatsapp_home.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'views/login_widget.dart';
/*
List<CameraDescription> cameras;
Future<Null>  main()async {
  cameras=await availableCameras();
  runApp(MyApp());
}*/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
      ),
      //home: Whatsapp(cameras),
      home: LoginWidget(),
    );
  }
}


