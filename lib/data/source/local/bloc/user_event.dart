part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class SetUserEvent extends UserEvent {
  final UserModel user;

  const SetUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class ClearUserEvent extends UserEvent {}
