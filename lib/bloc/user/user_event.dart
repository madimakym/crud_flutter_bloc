part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserBackEvent extends UserEvent {}

class UserGetStarted extends UserEvent {}

class UserCreateStarted extends UserEvent {
  final String firstname;
  final String lastname;
  UserCreateStarted({@required this.firstname, this.lastname});
}
