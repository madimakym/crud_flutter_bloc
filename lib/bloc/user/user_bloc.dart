import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:demo/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _userRepository = UserRepository();
  UserBloc() : super(UserInitial());


  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    yield UserInProgress();

    if (event is UserGetStarted) {
      try {
        var res = await _userRepository.readUser();
        var status = res.statusCode;
        var jsonData = res.body;
        print("get resp status: $status");
        print("get resp  data: $jsonData");
        yield UserGetSuccess(status: status, data: jsonData);
      } catch (e) {
        yield UserFailure();
      }
    }

    if (event is UserCreateStarted) {
      try {
        var res =
            await _userRepository.createUser(event.firstname, event.lastname);
        var status = res.statusCode;
        var jsonData = res.body;
        print("get resp status: $status");
        print("get resp  data: $jsonData");
        yield UserCreateSuccess(status: status, data: jsonData);
      } catch (e) {
        yield UserFailure();
      }
    }
  }
}
