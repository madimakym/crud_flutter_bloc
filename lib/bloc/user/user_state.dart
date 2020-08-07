part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class UserInProgress extends UserState {}


class UserGetSuccess extends UserState {
  final String data;
  int status;
  UserGetSuccess({this.data, this.status});
}

class UserCreateSuccess extends UserState {
  final String data;
  int status;
  UserCreateSuccess({this.data, this.status});
}

class UserFailure extends UserState {}
