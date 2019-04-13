import 'package:flutter/material.dart';
import 'views/login_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/user_bloc.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  UserBloc userBloc= UserBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      bloc: userBloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: new Color(0xff075E54),
          accentColor: new Color(0xff25D366),
        ),
        home: LoginWidget(),
      ),
    );
  }
}


