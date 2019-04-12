import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_ms/views/whatsapp_home.dart';
import 'package:camera/camera.dart';


class LoginWidget extends StatelessWidget {
  final GoogleSignIn googleSignIn= GoogleSignIn();
  final FirebaseAuth firebaseAuth= FirebaseAuth.instance;
  List<CameraDescription> cameras;
  void login(BuildContext context)async{
    GoogleSignInAccount gUser=await googleSignIn.signIn();
    GoogleSignInAuthentication authentication=await gUser.authentication;
    final AuthCredential credential= GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken
    );
    FirebaseUser firebaseUser=await firebaseAuth.signInWithCredential(credential);
    cameras=await availableCameras();
    if(firebaseUser!=null){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>Whatsapp(cameras)));
    }else{
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("No se pudo iniciar sesión"),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Login"),
          onPressed: ()=> login(context),
      ),
    );
  }
}
