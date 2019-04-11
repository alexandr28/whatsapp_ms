import 'package:flutter/material.dart';
import 'package:whatsapp_ms/models/chat_item.dart';

class CheckWidget extends StatelessWidget {
  final CheckStatus checkStatus;
  CheckWidget({@required this.checkStatus}): assert(checkStatus!=null);
  @override
  Widget build(BuildContext context) {
    switch(checkStatus){
      case CheckStatus.uncheck:
        return Container();
        break;
      case CheckStatus.check:
        return Icon(Icons.check,size: 17.0,color: Colors.grey[400],);
        break;
      case CheckStatus.doublecheckblue:
        return Icon(Icons.done_all,color: Colors.lightBlue[300],size: 17.0,);
        break;
      case CheckStatus.doublecheck:
        return Icon(Icons.done_all, size: 17.0,color: Colors.grey[400],);
        break;
    }
    return Container();
  }
}
