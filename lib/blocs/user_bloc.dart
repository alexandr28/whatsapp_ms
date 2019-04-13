import 'package:bloc/bloc.dart';
import 'package:whatsapp_ms/models/user.dart';
enum UserEvent{
  none,
  waiting,
  logged_in,
  error,
}

class UserBloc extends Bloc<UserEvent,User>{
  @override
  // TODO: implement initialState
  get initialState => User(event:UserEvent.none);

  @override
  Stream<User> mapEventToState(UserEvent event)async*{
    // TODO: implement mapEventToState
    User user=User();
    user.event=event;
    yield user;
  }
}